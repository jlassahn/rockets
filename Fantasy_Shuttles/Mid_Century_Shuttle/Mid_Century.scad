$fa = 1;
$fs = 0.5;
$fn = 0;

include <../../Printed_Parts/Rocket_Constants.scad>
use <../../Printed_Parts/Tubes.scad>
use <../../Printed_Parts/Ogive_Cone.scad>

//translate([75,0,0])square([5, 55]);

module canard()
{
    rotate([90,0,0])
    linear_extrude(1.58, center=true)
    difference()
    {
        square([30, 70]);
        translate([30,0])scale([1,0.40])circle(r=30);
        translate([60,70])scale([1,0.75])circle(r=60);
    }
}


module main_wing()
{
    rotate([90,0,0])
    linear_extrude(1.58, center=true)
    difference()
    {
        square([70, 180]);

        translate([145, 180, 0])circle(r=145);
        //translate([0,20,0]) rotate([0,0,-107]) square(75);
        translate([0,-110,0]) circle(r=130);
    }
}

module wing()
{
    translate([0,0,50])
    rotate([0,25,0])
    difference()
    {
        rotate([0,-25,0])
        translate([0,0,-50])
        main_wing();
        mirror([0,0,1])
        translate([0,-5,0])
        cube([150,10, 100]);
    }
    
    translate([0,0,50])
    rotate([0,25,0])
    rotate([15,0,0])
    intersection()
    {
        rotate([0,-25,0])
        translate([0,0,-50])
        intersection()
        {
            main_wing();
            cube([130,10,400], center=true);
        }
        mirror([0,0,1])
        translate([0,-5,0])
        cube([150, 10, 100]);
    }
    
    translate([70,0,27.5])
    Ogive_Cone(10, 60, 1, 3);
    translate([70,0,27.5])
    rotate([180,0,0])
    Ogive_Cone(10, 60, 1, 3);
}


mirror([1,0,0])
rotate([0,0,15])
translate([BT20_OR, 0, 0])
wing();

rotate([0,0,15])
translate([BT20_OR, 0, 0])
wing();

//translate([0,0,50]) BT20(150);
translate([0,0,50]) BT20(130);

translate([0,0,50])
rotate([180,0,0])
Ogive_Transition(BT20_OD, 12, 30, 1);

//translate([0,0,200])
translate([0,0,180])
Ogive_Cone(BT20_OD, 80, 1, 3);

/*
translate([BT20_OR, 0, 160])
canard();

mirror([1,0,0])
translate([BT20_OR, 0, 160])
canard();
*/
