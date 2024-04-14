$fa = 1;
$fs = 0.4;

overall_height = 4;
base_cyl_radius = 30;
base_rim_thickness = 2;
base_width_offset = 70;

font_size = 32;
font = "Felix Titling";

module base_plate()
{
    difference()
    {
        hull()
        {
            translate([ -base_width_offset, 0, 0 ]) cylinder(h = overall_height, r = base_cyl_radius, center = true);
            translate([ base_width_offset, 0, 0 ]) cylinder(h = overall_height, r = base_cyl_radius, center = true);
        }

        translate(v = [ 0, 0, 2 ]) hull()
        {
            translate([ -base_width_offset, 0, 0 ])
                cylinder(h = overall_height, r = base_cyl_radius - base_rim_thickness, center = true);
            translate([ base_width_offset, 0, 0 ])
                cylinder(h = overall_height, r = base_cyl_radius - base_rim_thickness, center = true);
        }
    }
}

module name()
{
    translate(v = [ -0.5, -0.5, 0 ]) linear_extrude(height = 1)
        text(text = "Calypso", size = font_size, font = font, halign = "center", valign = "center");
}

base_plate();
name();