

height = 10 - 1;
inner_radius = 1.8;
outer_radius = 3.1;

difference() {
    cylinder(height, outer_radius, outer_radius, $fn=32);
    translate([0, 0, -1]) cylinder(height + 2, inner_radius, inner_radius, $fn=32);
}