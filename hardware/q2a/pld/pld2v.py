import sys

class Assignment(object):
  def __init__(self, start):
    parts = [x.strip() for x in start.split('=')]
    self.negated = parts[0][0] == '/'
    parts[0] = parts[0].replace('/', '')
    self.register = False
    self.enable = False
    self.tristate = False
    if '.r' in parts[0]:
      self.register = True
      self.pin = parts[0][:-2]
    elif '.e' in parts[0]:
      self.enable = True
      self.pin = parts[0][:-2]
    elif '.t' in parts[0]:
      self.tristate = True
      self.pin = parts[0][:-2]
    else:
      self.pin = parts[0]
    self.line = parts[1]

  def append(self, line):
    self.line += line

  def expression(self):
    if self.negated:
      expr = '~('
    else:
      expr = '('
    first_term = True
    for term in self.line.split('+'):
      if not first_term:
        expr += ' | '
      first_term = False
      expr += '('
      first_prod = True
      for inp in [x.strip() for x in term.split('*')]:
        if not first_prod:
          expr += ' & '
        if inp[0] == '/':
          expr += '~'
        expr += inp.replace('/', '')
        first_prod = False
      expr += ')'
    expr += ')'
    return expr

  def inputs(self):
    result = set()
    for term in self.line.split('+'):
      for prod in term.split('*'):
        result.add(prod.replace('/', '').strip())
    return result

  def declaration(self):
    if self.register:
      return 'output reg {} = 0'.format(self.pin)
    elif self.enable:
      return ''
    elif self.tristate:
      return 'inout wire {}'.format(self.pin)
    else:
      return 'output wire {}'.format(self.pin)


def next_line(fd):
  while True:
    line = next(fd)
    if ';' in line:
      line = line[:line.index(';')]
    line = line.strip()
    if len(line) > 0:
      return line.lower()


def read_file(filename):
  assignments = []
  name = ''
  with open(filename, 'r') as fd:
    try:
      part = next_line(fd)
      print('PART: {}'.format(part))
      name = next_line(fd)
      print('NAME: {}'.format(name))
      input_pins = next_line(fd)
      output_pins = next_line(fd)

      current = None
      while True:
        line = next_line(fd)
        if '=' in line:
          current = Assignment(line)
          assignments.append(current)
        elif '+' in line or '*' in line:
          current.append(line)
    except StopIteration:
      return name, assignments


def main():
  if len(sys.argv) != 2:
    print('usage {} <filename>'.format(sys.argv[0]))
    return
  filename = sys.argv[1]
  name, assignments = read_file(filename)

  inputs = set()
  for assignment in assignments:
    inputs |= assignment.inputs()
  for assignment in assignments:
    inputs.discard(assignment.pin)
  inputs.discard('clk')

  ofd = open('{}.v'.format(name), 'w')
  ofd.write('module {}(\n'.format(name))
  ports = []
  ports.append('input wire clk')
  for inp in inputs:
    ports.append('input wire {}'.format(inp))
  for assignment in assignments:
    port = assignment.declaration()
    if len(port) > 0:
      ports.append(port)
  for port in ports[:-1]:
    ofd.write('  {},\n'.format(port))
  ofd.write('  {}\n'.format(ports[-1]))
  ofd.write(');\n')

  for a in assignments:
    if a.register:
      ofd.write('  always @(posedge clk) begin\n')
      ofd.write('    {} <= {};'.format(a.pin, a.expression()));
      ofd.write('  end\n')
    elif a.tristate:
      enable = [x for x in assignments if x.pin == a.pin and x.enable]
      enable_expr = enable[0].expression()
      ofd.write(
        '  assign {} = {} ? {} : 1\'bz;\n'.format(
          a.pin, enable_expr, a.expression()
        )
      )
    elif not a.enable:
      ofd.write('  assign {} = {};\n'.format(a.pin, a.expression()));
  ofd.write('endmodule\n')
  ofd.close()


if __name__ == '__main__':
  main()
