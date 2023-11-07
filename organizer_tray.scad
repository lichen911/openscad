$fa = 1;
$fs = 0.4;

base_length = 200;
base_width = 50;
base_depth = 25;

wall_thick = 2;


// bottom
translate([0, 0, wall_thick/2])
cube([base_length, base_width, wall_thick], center=true);

// long sides
translate([0, base_width / 2, (base_depth + wall_thick) / 2])
cube([base_length, wall_thick, base_depth + wall_thick], center=true);

translate([0, -base_width / 2, (base_depth + wall_thick) / 2])
cube([base_length, wall_thick, base_depth + wall_thick], center=true);

// short sides
translate([base_length / 2, 0, (base_depth + wall_thick) / 2])
cube([wall_thick, base_width + wall_thick, base_depth + wall_thick], center=true);

translate([-base_length / 2, 0, (base_depth + wall_thick) / 2])
cube([wall_thick, base_width + wall_thick, base_depth + wall_thick], center=true);
