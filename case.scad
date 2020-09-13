
board_width = 150;
board_depth = 180;
base_height = 10;
panel_width = board_width;
panel_height = 100;
panel_depth = 10;
thickness = 0.8;
switch_radius = 3.1;
switch_spacing = 3.5;

module meniscus(height, radius) {
    difference() {
        cube([radius, radius, height]);
        cylinder(height, radius + 0.1, radius + 0.1);
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

module switches(x, y, count) {
    for (i = [0:count-1]) {
        translate([
            7 + (x + i) * switch_radius * switch_spacing,
            y * switch_radius * switch_spacing,
            panel_depth - thickness
        ]) {
            cylinder(thickness, switch_radius, switch_radius, $fn=32);
        }
    }
}

module label(x, y, text) {
    size = 2.5;
    translate([
        7 + x * switch_radius * switch_spacing - switch_radius + 0.5,
        y * switch_radius * switch_spacing - switch_radius * 2.5,
        panel_depth - thickness / 2
    ]) {
        linear_extrude(thickness / 2) {
            text(text = text, font = "Courier", size = size);
        }
    }
}

module render_base() {
    difference() {
        rounded_cube(
            board_width + 2 * thickness,
            board_depth + 2 * thickness,
            base_height + thickness
        );
        translate([thickness, thickness, thickness]) {
            rounded_cube(board_width, board_depth, base_height);
        }
    }
}

module render_panel() {
    difference() {
        rounded_cube(panel_width + 2 * thickness, panel_height + 2 * thickness, panel_depth);
        translate([thickness, thickness, -thickness]) {
            rounded_cube(panel_width, panel_height, panel_depth);
        }
        
        // Data LEDs
        switches(1, 8, 12);
        label(1, 8, "Data");
        
        // Address LEDs
        switches(1, 6, 12);
        label(1, 6, "Address");
        
        // Power switch and LED.
        switches(1, 4, 2);
        label(1, 4, "Power");
        
        // Speed
        switches(4, 4, 1);
        label(4, 4, " >");
        
        // Run LED, start, stop
        switches(6, 4, 3);
        label(7, 4, "RUN");
        label(8, 4, "HLT");
        
        // Rest, increment, deposit
        switches(10, 4, 3);
        label(10, 4, "SET");
        label(11, 4, "INC");
        label(12, 4, "DEP");
        
        // Input switches
        switches(1, 2, 12);
        label(1, 2, "Input");
    }
}

render_base();
translate([0, 5, 0]) {
    rotate([60, 0, 0]) {
        render_panel();
    }
}