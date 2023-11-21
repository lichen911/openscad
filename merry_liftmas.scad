$fa = 1;
$fs = 0.4;

use <text_on.scad>

overall_radius = 50;
overall_height = 6;
rim_thickness = 5;
rim_depth = 2;
inner_radius = 12;
letter_height = overall_height / 2 - 1.5;
font_size = 12;
icon_font_size = 6;
text_radius_ratio = 0.65;
icon_distance_from_center = 30;
icon_vertical_distance = 3.5;
font = "Impact";
icon_text_separation = 7.3;

module base_plate()
{
    difference()
    {
        union()
        {
            difference()
            {
                cylinder(h = overall_height, r = overall_radius, center = true);

                translate([ 0, 0, overall_height - rim_depth ])
                    cylinder(h = overall_height, r = overall_radius - rim_thickness, center = true);

                translate([ 0, 0, -overall_height + rim_depth ])
                    cylinder(h = overall_height, r = overall_radius - rim_thickness, center = true);
            }

            cylinder(h = overall_height, r = inner_radius, center = true);
        }

        cylinder(h = overall_height + 1, r = inner_radius - rim_thickness, center = true);
    }
}

module merry_liftmas()
{
    translate([ 0, 0, letter_height ])
        text_on_circle(t = "MERRY", r = overall_radius * text_radius_ratio, font = font, direction = "ltr",
                       size = font_size, spacing = 1.5, extrusion_height = letter_height, rotate = 8);

    translate([ 0, 0, letter_height ])
        text_on_circle(t = "LIFTMAS", r = overall_radius * text_radius_ratio, font = font, direction = "ltr",
                       size = font_size, spacing = 1.27, extrusion_height = letter_height, ccw = true, rotate = -1);
}

module weight_icon()
{
    linear_extrude(height = overall_height / 2 - 0.8)
        translate(v = [ -icon_distance_from_center, icon_vertical_distance, 0 ]) union()
    {
        text(text = "20", size = icon_font_size, font = font, halign = "center", valign = "center");
        translate(v = [ 0, -icon_text_separation, 0 ])
            text(text = "23", size = icon_font_size, font = font, halign = "center", valign = "center");
    }
}

module front_text()
{
    union()
    {
        merry_liftmas();
        weight_icon();
        translate(v = [ 0, 0, 0 ]) rotate(a = [ 0, 0, 180 ]) weight_icon();
    }
}

module ornament()
{
    difference()
    {
        base_plate();

        // cut out hanging hole
        translate(v = [ 0, overall_radius - rim_thickness - 2.2, 0 ]) cylinder(h = 40, r = 2, center = true);
    }

    front_text();
    rotate(a = [ 0, 180, 0 ]) front_text();
}

ornament();