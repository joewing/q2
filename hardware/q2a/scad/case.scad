
board_width = 196;
board_depth = 160;
base_height = 11.6;
panel_width = board_width;
panel_height = 100;
panel_depth = 10;
panel_angle = 60;
pcb_thickness = 1.6;
tol = 2;
thickness = 3.6;
switch_radius = 3.6;
led_radius = 1.7;
switch_spacing = 3.5;
screw_radius = 1.9;
screw_head_radius = 2.9;
screw_head_height = 3.1;
standoff_height = thickness + base_height - screw_head_height - pcb_thickness;
standoff_radius = 3.6;
board_offset = 40;
switch_offset = 10;
extra = 1.0;    // Extra cutout for PCB


standoff_positions = [
    [standoff_radius, standoff_radius],
    [board_width - standoff_radius, standoff_radius],
    [standoff_radius, board_depth - standoff_radius],
    [board_width - standoff_radius, board_depth - standoff_radius],
];

module meniscus(height, radius) {
    difference() {
        translate([0,0, -1]) cube([radius, radius, height + 2]);
        cylinder(height + 0.01, radius + 0.2, radius + 0.2);
    }
}

module rounded_cube(x, y, z, r = 3) {
    difference() {
        cube([x, y, z]);
        translate([x - r, y - r]) meniscus(z + 0.01, r + 0.01);
        translate([r, y - r]) rotate([0, 0, 90]) meniscus(z + 0.01, r + 0.01);
        translate([r, r]) rotate([0, 0, 180]) meniscus(z + 0.01, r + 0.01);
        translate([x - r, r]) rotate([0, 0, 270]) meniscus(z + 0.01, r + 0.01);
    }
}

// 1 on each side, and 1/2 for nibble spacing:
switch_spacingx = panel_width / (3 * 0.5 + 2 * 0.5 + 15);

// 4 lines with extra on the top and bottom divides the panel into 5:
switch_spacingy = panel_height / (1 + 4);

function bumps(x) = x > 3 ? (x > 7 ? (x > 11 ? 2 : 1.5) : 1.0) : 0.5;

module switches(x, y, count, is_switch = true) {
    radius = is_switch ? switch_radius : led_radius;
    for (i = [0:count-1]) {
        bump = bumps(x + i);
        translate([
            thickness + (x + i + bump - 0.5) * switch_spacingx,
            (y) * switch_spacingy + base_height + thickness,
            panel_depth - thickness - tol
        ]) {
            cylinder(panel_depth, radius, radius, $fn=32);
        }
    }
}

module label(x, y, text, size = 3.2) {
    bump = bumps(x);
    translate([
        (x + bump - 0.5) * switch_spacingx,
        (y) * switch_spacingy - 2.5 * switch_radius + base_height + thickness,
        panel_depth + thickness / 2 + 0.01
    ]) {
        linear_extrude(thickness / 2) {
            text(text = text, font = "Copperplate:style=bold", size = size, spacing=1.1);
        }
    }
}

module standoff(x, y) {
    translate([x, y, thickness - 0.01]) {
        cylinder(standoff_height, standoff_radius, standoff_radius, $fn=32);
    }
}

module standoff_hole(x, y, flip = false) {
    translate([x, y, -tol - thickness]) {
        cylinder(standoff_height + tol + thickness + pcb_thickness, screw_radius, screw_radius, $fn=32);
        translate([0, 0, flip ? standoff_height + thickness + tol - screw_head_height : 0]) {
            cylinder(screw_head_height + tol, screw_head_radius, screw_head_radius, $fn=32);
        }
    }
}

module render_base() {
    difference() {
        rounded_cube(
            board_width + 2 * thickness,
            board_depth + 2 * thickness + board_offset,
            base_height + thickness
        );
        translate([thickness - extra, thickness - extra, thickness + 0.01]) {
            rounded_cube(board_width + extra * 2, board_depth + board_offset + extra * 2, base_height);
        }
    }
    translate([thickness, thickness + board_offset, 0]) {
        for (pos = standoff_positions) {
            standoff(pos[0], pos[1]);
        }
    }
}

module render_panel() {
    difference() {
        union() {
            difference() {
                rounded_cube(panel_width + 2 * thickness, panel_height + 2 * thickness + base_height, panel_depth + thickness);
                translate([thickness - extra, thickness + base_height - extra, -thickness]) {
                    rounded_cube(panel_width + 2 * extra, panel_height + 2 * extra, panel_depth + thickness);
                }
            }
            translate([0, base_height, 0]) {
                cube([thickness + standoff_radius, panel_height + thickness + extra, panel_depth + thickness]);
            }
            translate([panel_width - standoff_radius + thickness, base_height, 0]) {
                cube([thickness + standoff_radius, panel_height + thickness + extra, panel_depth + thickness]);
            }
            translate([thickness, base_height + panel_height + thickness + 2 * extra, 0]) {
                difference() {
                    rotate([60, 0, 0]) {
                        cube([panel_width, panel_depth * 2, panel_depth * 2]);
                    }
                    translate([-1, -panel_depth * 2, panel_depth + thickness - extra]) {
                        cube([panel_width + 2, panel_depth * 4, panel_depth * 4]);
                    }
                    translate([-1, -extra, -panel_depth * 2]) {
                        cube([panel_width + 2, panel_depth * 2, panel_depth * 4]);
                    }
                }
            }
            translate([thickness, thickness, -thickness]) {
                standoff(standoff_radius, base_height + standoff_radius);
                standoff(panel_width - standoff_radius, base_height + standoff_radius);
                standoff(standoff_radius, base_height + panel_height - standoff_radius);
                standoff(panel_width - standoff_radius, base_height + panel_height - standoff_radius);
            }
        }
        
        translate([thickness, thickness, thickness]) {
            standoff_hole(standoff_radius, base_height + standoff_radius, true);
            standoff_hole(panel_width - standoff_radius, base_height + standoff_radius, true);
            standoff_hole(standoff_radius, base_height + panel_height - standoff_radius, true);
            standoff_hole(panel_width - standoff_radius, base_height + panel_height - standoff_radius, true);
        }
        
        // Field LEDs
        switches(1, 4, 3, false);
        label(1, 4, "Field");
        
        // Address LEDs
        switches(4, 4, 12, false);
        label(4, 4, "Address");
        
        // Data LEDs
        switches(4, 3, 12, false);
        label(4, 3, "Data");
        
        // Power switch and LED
        switches(1, 2, 1, false);
        switches(2, 2, 1, true);
        label(1, 2, "Power");

        // Run LED, start, stop
        switches(4, 2, 1, false);
        switches(5, 2, 2, true);
        label(4, 2, "RUN");
        label(6, 2, "HLT");
        
        // Reset / Increment / Deposit
        switches(11, 2, 1, true);
        switches(13, 2, 2, true);
        label(11, 2, "SET");
        label(13, 2, "INC");
        label(14, 2, "DEP");
        
        // Field switches
        switches(1, 1, 3, true);
        label(1, 1, "Field");
        
        // Data switches
        switches(4, 1, 12, true);
        label(4, 1, "Input");
        
        label(11, 0.25, "Q2A", 12);
    }
}

difference() {
    union() {
        render_base();
        translate([0, board_offset / 2, base_height]) {
            height = (panel_height + thickness + base_height / 2) * sin(panel_angle);
            width = (panel_height + thickness + base_height / 2) * cos(panel_angle) - 2;
            translate([0, -board_offset / 4, 0]) difference() {
                cube([board_width + thickness * 2, width, height]);
                translate([-1, -1, 0]) rotate([panel_angle, 0, 0]) {
                    cube([board_width + thickness * 2 + 2, board_depth, height]);
                }
                translate([thickness - extra, 0, -1]) {
                    cube([board_width + extra * 2, board_depth + extra + board_offset, height + 2]);
                }
            }
        }
        translate([0, base_height / 2 - 0.2, 2]) {
            rotate([panel_angle, 0, 0]) {
                render_panel();
            }
        }
    }
    translate([thickness, thickness + board_offset, thickness]) {
        for (pos = standoff_positions) {
            standoff_hole(pos[0], pos[1]);
        }
    }
}