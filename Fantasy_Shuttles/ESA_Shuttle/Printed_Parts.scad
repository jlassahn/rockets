
include <../../Printed_Parts/Rocket_Constants.scad>
use <../../Printed_Parts/Skew_Cone.scad>
use <../../Printed_Parts/Ogive_Cone.scad>

module _large_engine()
{
    difference()
    {
        scale([1,1,1.2])sphere(10);
        scale([1,1,1.2])sphere(9);
        translate([0,0,-10])
        cube([20, 20, 20], center = true);
    }
}

module booster_tail()
{
    translate([0,0,5])
    scale([BT50_OR/10, BT50_OR/10, 0.5])
    sphere(r=10);
    translate([0,0,-3])_large_engine();
}

module booster_nose()
{
    Skew_Cone(BT50_OD, 60, 1, 5);
}

module _small_engine()
{
    difference()
    {
        scale([1,1,1.5])sphere(8);
        scale([1,1,1.5])sphere(7);
        translate([0,0,-10])
        cube([20, 20, 20], center = true);
    }
}

module main_tail()
{
    translate([0,0,10])
    difference()
    {
        union()
        {
            scale([BT60_OR/10, BT60_OR/10, 1])
            sphere(r=10);
            translate([14, 0, -13])_small_engine();
            translate([-14, 0, -13])_small_engine();
            translate([0, 14, -13])_small_engine();
            translate([0, -14, -13])_small_engine();
        }
        scale([BT60_OR/10 - 0.1, BT60_OR/10 - 0.1, 0.9])
        sphere(r=10);        
        cylinder(20, 40, 40);
        cylinder(40, r=11, center = true);
    }
}

module main_nose()
{
    Ogive_Cone(BT60_OD, 75, 1, 8);
}

module orbiter_nose()
{
    Ogive_Cone(BT20_OD, 70, 1, 3);
}

module orbiter_tail()
{
    Ogive_Transition(BT20_OD, 10, 53, 1);
}

