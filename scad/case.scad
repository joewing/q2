
board_width = 150;
board_depth = 180;
base_height = 10;
panel_width = board_width;
panel_height = 100;
panel_depth = 10;
tol = 2;
thickness = 1.6 + tol;
switch_radius = 3.1;
switch_spacing = 3.5;
screw_radius = 1.7;
screw_head_radius = 2.8;
screw_head_height = 3;
standoff_height = base_height - 3.2;
standoff_radius = screw_head_radius * 1.8;


// center to center of the standoffs should be 143mm.
screw_offset = 3.5;
standoff_positions = [
    [screw_offset, screw_offset],
    [board_width - screw_offset, screw_offset],
    [screw_offset, board_depth - screw_offset],
    [board_width - screw_offset, board_depth - screw_offset]
];

module meniscus(height, radius) {
    difference() {
        cube([radius, radius, height]);
        cylinder(height, radius + 0.2, radius + 0.2);
    }
}

module rounded_cube(x, y, z, r = 3) {
    difference() {
        cube([x, y, z]);
        translate([x - r, y - r]) meniscus(z, r);
        translate([r, y - r]) rotate([0, 0, 90]) meniscus(z, r);
        translate([r, r]) rotate([0, 0, 180]) meniscus(z, r);
        translate([x - r, r]) rotate([0, 0, 270]) meniscus(z, r);
    }
}

module switches(x, y, count, notch) {
    for (i = [0:count-1]) {
        bump = x + i > 4 ? (x + i > 8 ? 9 : 5) : 1;
        translate([
            bump + (x + i) * switch_radius * switch_spacing + tol + 0.5,
            y * switch_radius * switch_spacing + tol,
            panel_depth - thickness
        ]) {
            cylinder(thickness, switch_radius, switch_radius, $fn=32);
        }
    }
}

module label(x, y, text) {
    size = 3;
    bump = x > 4 ? (x > 8 ? 9 : 5) : 1;
    translate([
        bump + x * switch_radius * switch_spacing - switch_radius + tol,
        y * switch_radius * switch_spacing - switch_radius * 2.5 + tol,
        panel_depth - thickness / 2
    ]) {
        linear_extrude(thickness / 2) {
            text(text = text, font = "Copperplate:style=bold", size = size, spacing=1.1);
        }
    }
}

module standoff(x, y) {
    translate([x + thickness, y + thickness, thickness]) {
        cylinder(standoff_height, standoff_radius, standoff_radius, $fn=32);
    }
}

module standoff_hole(x, y) {
    translate([x + thickness, y + thickness, 0]) {
        cylinder(standoff_height + thickness + tol * 2, screw_radius, screw_radius, $fn=32);
        cylinder(screw_head_height, screw_head_radius, screw_head_radius, $fn=32);
    }
}

module render_base() {
    difference() {
        rounded_cube(
            board_width + 2 * thickness,
            board_depth + 2 * thickness,
            base_height + thickness
        );
        translate([thickness - tol, thickness - tol, thickness]) {
            rounded_cube(board_width + tol * 2, board_depth + tol * 2, base_height);
        }
    }
    for (pos = standoff_positions) {
        standoff(pos[0], pos[1]);
    }
}

module render_panel() {
    difference() {
        rounded_cube(panel_width + 2 * thickness, panel_height + 2 * thickness, panel_depth);
        translate([thickness - tol, thickness - tol, -thickness]) {
            rounded_cube(panel_width + tol * 2, panel_height + tol * 2, panel_depth);
        }
        
        // Data LEDs
        switches(1, 8, 12, false);
        label(1, 8, "Address");
        
        // Address LEDs
        switches(1, 6, 12, false);
        label(1, 6, "Data");
        
        // Power switch and LED.
        switches(1, 4, 1, true);
        switches(2, 4, 1, false);
        label(1, 4, "Power");
        
        // Speed
        switches(4, 4, 1, false);
        label(4, 4, " 5k");
        
        // Run LED, start, stop
        switches(6, 4, 1, false);
        switches(7, 4, 2, true);
        label(7, 4, "RUN");
        label(8, 4, "HLT");
        
        // Rest, increment, deposit
        switches(10, 4, 3, true);
        label(10, 4, "SET");
        label(11, 4, "INC");
        label(12, 4, "DEP");
        
        // Input switches
        switches(1, 2, 12, true);
        label(1, 2, "Input");
    }
}

difference() {
    union() {
        render_base();
        translate([0, base_height / 2 - tol, 0]) {
            rotate([60, 0, 0]) {
                render_panel();
            }
        }
    }
    for (pos = standoff_positions) {
        standoff_hole(pos[0], pos[1]);
    }
}