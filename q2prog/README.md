
# Q2 Programmer

q2prog is a Q2 programmer for the Raspberry Pi.

## Building

* q2prog is written in Rust, so the first step is to
  [install Rust](https://www.rust-lang.org/tools/install)
  (note that rustup will also install cargo, which is required).
* Once rust and cargo are installed, run `cargo build`
  from this directory.
* The q2prog will be available as `target/debug/q2prog`, which can
  be used from this location or copied to a location in your path.

## Usage

To program the Q2, connect a 40-pin connector to both the GPIO pins
of the Raspberry Pi and the Q2 (be sure the pins line up correctly).
Make sure all input switches on the Q2 are "off". Some of the data LEDs
will glow, but that is just due to pull-downs on some of the GPIO pins.

To write an assembled program (prog.q2p), on the Raspberry Pi run:

```
  q2prog write -f prog.q2p
```

For more options, see `q2prog -h`.

