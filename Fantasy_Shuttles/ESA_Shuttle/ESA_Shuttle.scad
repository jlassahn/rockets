$fa = 1;
$fs = 0.5;
$fn = 0;


include <../../Printed_Parts/Rocket_Constants.scad>
use <../../Printed_Parts/Tubes.scad>
use <../../Printed_Parts/Skew_Cone.scad>
use <../../Printed_Parts/Ogive_Cone.scad>

module booster()
{
    BT50(100);
    translate([0,0,100])
    Skew_Cone(BT50_OD, 60, 1, 5);
}

module body()
{
    translate([0,0,10])
    BT60(250);

    translate([0,0,260])
    Ogive_Cone(BT60_OD, 75, 1, 8);

    cylinder(10, 15, BT60_OR);
}

module fin()
{
    rotate([0,90,0])
    linear_extrude(1.58,center=true)
    polygon([[0,0],[24,36],[48,36],[48,0]]);
}

module wing()
{
    translate([-BT20_OR,0, 130])
    rotate([0,0,90])
    rotate([0,90,0])
    linear_extrude(1.58,center=true)
    polygon([[0,0], [50,15], [90,55],[105,55],[120,0]]);
}

module stack()
{
    body();

    rotate([0,0,30])
    translate([-BT60_OR - BT50_OR, 0, 0])
    booster();

    rotate([0,0,150])
    translate([-BT60_OR - BT50_OR, 0, 0])
    booster();

    rotate([0,0,120])
    translate([0,BT60_OR + BT50_OD,48])
    fin();

    rotate([0,0,-120])
    translate([0,BT60_OR + BT50_OD,48])
    fin();
}

module orbiter()
{
    translate([0, 0, 50])
    BT20(80);

    translate([0,0,130])
    Ogive_Cone(BT20_OD, 70, 1, 3);

    translate([0,0,50])
    rotate([180,0,0])
    Ogive_Transition(BT20_OD, 10, 50, 1);

    wing();
    mirror([1,0,0]) wing();

    translate([0,BT20_OR,48])
    fin();
}

translate([0, BT60_OR + BT20_OR + 3, 0])
orbiter();

stack();

