$fa = 1;
$fs = 0.5;
$fn = 0;

include <../../Printed_Parts/Rocket_Constants.scad>
use <../../Printed_Parts/Tubes.scad>
use <../../Printed_Parts/Ogive_Cone.scad>


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


_pod_r = (10-3)/4 + (60-3/2)*(60-3/2)/(10-3) + 3/2;
_elevon_angle = atan(1/2);
// echo(_pod_r);  // = 492.143
module _wing_base_outline()
{
    difference()
    {
        square([70, 180]);

        translate([145, 180])circle(r=145);
        translate([0,-110]) circle(r=130);

        translate([70 + _pod_r - 2, 27.5])
        circle(_pod_r);
    }
    translate([65,20])
    square([10,30]);
}

module _wing_outline()
{
    translate([0,50])
    rotate([0,0,-_elevon_angle])
    intersection()
    {
        rotate([0,0,_elevon_angle])
        translate([0,-50])
        _wing_base_outline();

        translate([-100,0])
        square([200, 200]);
    }
}

module _elevon_outline()
{
    translate([0,50])
    rotate([0,0,-_elevon_angle])
    intersection()
    {
        rotate([0,0,_elevon_angle])
        translate([0,-50])
        _wing_base_outline();

        translate([-100,-200])
        square([200, 200]);
    }
}

module _fin_outline()
{
    difference()
    {
        _wing_base_outline();
        translate([0,120])
        square([BT60_OR - BT20_OR, 100]);
    }
}

module _fin()
{
    rotate([90,0,0])
    linear_extrude(1.58, center=true)
    _fin_outline();
}

module _wing()
{
    rotate([90,0,0])
    linear_extrude(1.58, center=true)
    _wing_outline();
}

module _elevon(trim)
{
    
    translate([0,0,50])
    rotate([0,_elevon_angle,0])
    rotate([trim,0,0])
    rotate([0,-_elevon_angle,0])
    translate([0,0,-50])

    rotate([90,0,0])
    linear_extrude(1.58, center=true)
    _elevon_outline();
}

module _pod()
{
    translate([73,0,27.5])
    {
        difference()
        {
            union()
            {
                Ogive_Cone(10, 60, 1, 3);
                rotate([180,0,0])
                Ogive_Cone(10, 60, 1, 3);
            }
            translate([-10,-1,19.5 - 27.5])
            cube([10,2,31]);
        }
    }
}

module wing()
{
    _wing();
    _elevon(15);
    _pod();
}

module orbiter()
{
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
}

module booster()
{
    translate([0,0,320])
    Ogive_Cone(BT60_OD, 150, 1, 3);

    translate([0,0,120])
    BT60(200);

    translate([0,0,120])
    rotate([180,0,0])
    Ogive_Transition(BT60_OD, BT20_OD, 100, 1);

    rotate([0,0,-90])
    translate([BT20_OR, 0, 0])
    {
        _fin();
        _pod();
    }
}

translate([0, BT60_OR + BT20_OR + 3, 0])
orbiter();

booster();
