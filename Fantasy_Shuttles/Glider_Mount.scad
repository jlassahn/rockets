
$fa = 1;
$fs = 0.5;
$fn = 0;

include <../Printed_Parts/Rocket_Constants.scad>
use <../Printed_Parts/Tubes.scad>

//BT60(20);
//BT20(20);
//LLUG(20);

module booster()
{
    BT60(100);
}

module glider()
{
    BT20(100);
    
    translate([-BT20_OR - LLUG_OR, 0, 75])
    LLUG(10);
    
    rotate([0,0,60])
    translate([-BT20_OR - LLUG_OR, 0, 5])
    LLUG(10);

    rotate([0,0,-60])
    translate([-BT20_OR - LLUG_OR, 0, 5])
    LLUG(10);
}

GLIDER_GAP = 1;
glider_offset = BT20_OR + BT60_OR + LLUG_OD + GLIDER_GAP;


module pin(height)
{
    cylinder(h=height, r=LLUG_IR-0.2);
    translate([0,0,height])sphere(r=LLUG_IR-0.2);
}

module rear_mount()
{

    dy = sin(60)*(BT20_OR + LLUG_OR);
    dx = glider_offset - cos(60)*(BT20_OR + LLUG_OR);
    pin_r = LLUG_IR - 0.2;
    linear_extrude(5)
    {
        difference()
        {
            polygon([
                [10, dy+pin_r],
                [dx, dy+pin_r],
                [dx, dy-pin_r],
                [23, 0],
                [dx, -dy+pin_r],
                [dx, -dy-pin_r],
                [10, -dy-pin_r],
                [10, -dy+pin_r],
                [dx-2, -dy+pin_r],
                [21, 0],
                [dx-2, dy-pin_r],
                [10, dy-pin_r]
            ]);
            circle(BT60_OR);
        }
    }
    intersection()
    {
        translate([20,0,0])
        cube([30, 2*dy + LLUG_ID-0.4, 20], center=true);
        difference()
        {
            union()
            {
                translate([0,0,5])
                cylinder(h=5, r1=BT60_OR+2, r2=BT60_OR+0.5);
                cylinder(h=5, r=BT60_OR+2);
            }
            translate([0,0,-0.5])cylinder(h=12, r=BT60_OR);
        }
    }


    translate([glider_offset, 0, 0])
    {
        rotate([0,0,60])
        translate([-BT20_OR - LLUG_OR, 0, 0])
        pin(12);

        rotate([0,0,-60])
        translate([-BT20_OR - LLUG_OR, 0, 0])
        pin(12);
    }
}

module front_mount()
{
    linear_extrude(7)
    difference()
    {
        polygon([
            [10, 6],
            [21, 6],
            [BT60_OR + LLUG_OR + GLIDER_GAP, LLUG_IR-0.2],
            [BT60_OR + LLUG_OR + GLIDER_GAP, -LLUG_IR+0.2],
            [21, -6],
            [10, -6]
        ]);
        circle(r=BT60_OR);
    }
    translate([glider_offset-BT20_OR -LLUG_OR, 0, 0])
    pin(14);
}

rear_mount();

translate([0,0,68]) front_mount();

color([0.5,0,0,0.5])
translate([glider_offset, 0, 0])
glider();

booster();

