$fa = 1;
$fs = 0.4;

base_length = 195;
base_width = 60;
base_depth = 55;

wall_thick = 3;


difference() {
    translate([0, 0, base_depth/2])
    cube([base_length, base_width, base_depth], center=true);

    resize([base_length - wall_thick, base_width - wall_thick])
    translate([0, 0, base_depth/2 + wall_thick])
    cube([base_length, base_width, base_depth], center=true);
}