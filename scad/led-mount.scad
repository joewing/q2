
top_radius = 8 / 2;
outer_radius = 5.9 / 2;
inner_radius = 3.2 / 2;
clip_radius = 6.4 / 2;
height = 5.8;

difference() {
    union() {
        cylinder(height, outer_radius, outer_radius, $fn=32);
        cylinder(1, top_radius, top_radius, $fn=32);
        translate([0, 0, height - 4]) {
            cylinder(2, outer_radius, clip_radius, $fn=32);
        }
        translate([0, 0, height - 2]) {
            cylinder(2, clip_radius, outer_radius, $fn=32);
        }
    }
    cylinder(height, inner_radius, inner_radius, $fn=32);
    translate([0, 0, height - 3]) {
        cylinder(1, 2.1, 2.1, $fn=32);
    }
    translate([-8, -0.4, 1]) {
        cube([16, 0.8, height]);
    }
    translate([-0.4, -8, 1]) {
        cube([0.8, 16, height]);
    }
    translate([0, 0, height - 1.6]) {
        cylinder(1.6, inner_radius, outer_radius, $fn=32);
    }
    translate([0, 0, 1]) {
        cylinder(height - 3, inner_radius + 0.2, inner_radius + 0.2, $fn=32);
    }
}

