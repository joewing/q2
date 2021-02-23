
board_width = 240;
board_height = 314;
wall_width = 2;
board_overlap = 2;
tol = 0.2;
screw_radius = 1.7;
screw_head_radius = 2.8;
screw_head_height = 3;
screw_offset = 3.5;
standoff_height = 10;
standoff_radius = screw_head_radius * 1.6;

interlock_width = 20;

case_width = board_width + (wall_width + tol) * 2;
case_height = board_height + (wall_width + tol) * 2;
case_depth = 1.6 + standoff_height + wall_width;

standoff_positions = [
    [screw_offset, screw_offset],
    [board_width - screw_offset, screw_offset],
    [board_width / 2, 30],
    [screw_offset, board_height - screw_offset],
    [board_width - screw_offset, board_height - screw_offset],
    [board_width / 2, 172]
];

module meniscus(height, radius) {
    difference() {
        cube([radius + 0.1, radius + 0.1, height]);
        translate([-0.1, -0.1, -0.1]) {
            cylinder(height + 0.1, radius + 0.1, radius + 0.1, $fn=32);
        }
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

module screw_hole(x, y) {
    translate([x + wall_width, y + wall_width, -tol]) {
        cylinder(
            standoff_height + wall_width + tol * 2,
            screw_radius,
            screw_radius,
            $fn=32
        );
        cylinder(
            screw_head_height + tol * 2,
            screw_head_radius,
            screw_head_radius,
            $fn=32
        );
    }
}

module standoff(x, y) {
    translate([x + wall_width, y + wall_width, wall_width]) {
        cylinder(standoff_height, standoff_radius, standoff_radius, $fn=32);
    }
}


module full_case() {
    difference() {
        union() {
            difference() {
                rounded_cube(case_width, case_height, case_depth);
                translate([wall_width + board_overlap, wall_width + board_overlap, wall_width]) {
                    rounded_cube(
                        case_width - board_overlap * 2 - wall_width * 2,
                        case_height - board_overlap * 2 - wall_width * 2 + tol,
                        standoff_height
                    );
                }
                translate([
                    wall_width - tol,
                    wall_width - tol,
                    standoff_height + wall_width
                ]) {
                    rounded_cube(
                        board_width + tol,
                        board_height + tol,
                        case_depth - standoff_height
                    );
                }
            }
            for (pos = standoff_positions) {
                standoff(pos[0], pos[1]);
            }
        }
        for (pos = standoff_positions) {
            screw_hole(pos[0], pos[1]);
        }
    }
}

module interlock_holes(t) {
    // Make hole "t" bigger than insert.
    hole_size = 5;
    y = case_height / 2 - t / 2 + 25 - hole_size - wall_width;
    translate([wall_width - t / 2, y, 0]) {
        cube([interlock_width + t, hole_size + t, wall_width * 2]);
    }
    translate([case_width - wall_width - t / 2 - interlock_width, y, 0]) {
        cube([interlock_width + t, hole_size + t, wall_width * 2]);
    }
    translate([case_width - wall_width - board_overlap - t / 2, y - 50 + hole_size, wall_width]) {
        cube([board_overlap + t, 50 + t, standoff_height]);
    }
    translate([wall_width - t / 2, y - 50 + hole_size, wall_width]) {
        cube([board_overlap + t, 50 + t, standoff_height]);
    }
}

module front_half() {
    translate([0, -0, 0]) {
        union() {
            intersection() {
                full_case();
                cube([case_width, case_height / 2, case_depth]);
            }
            translate([wall_width, board_height / 2 - 25, wall_width]) {
                cube([interlock_width, 50, wall_width]);
            }
            translate([case_width - wall_width - interlock_width, board_height / 2 - 25, wall_width]) {
                cube([interlock_width, 50, wall_width]);
            }
            interlock_holes(0);
        }
    }
}

module back_half() {
    translate([0, 0, 0]) {
        difference() {
            intersection() {
                full_case();
                translate([0, case_height / 2, 0]) {
                    cube([case_width, case_height / 2, case_depth]);
                }
            }
            interlock_holes(tol);
        }
    }
}

//front_half();
back_half();
