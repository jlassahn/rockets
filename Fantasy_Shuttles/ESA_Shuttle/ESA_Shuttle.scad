$fa = 2;
$fs = 0.1;
$fn = 0;

include <../../Printed_Parts/Rocket_Constants.scad>
use <../../Printed_Parts/Tubes.scad>
use <../../Printed_Parts/Skew_Cone.scad>
use <../../Printed_Parts/Ogive_Cone.scad>

module booster()
{
    BT50(100);
    translate([0,0,100])
    Skew_Cone(BT50_OD, 40, 1, 5);
}

rotate([0,0,30])
translate([-BT60_OR - BT50_OR, 0, 0])
booster();

rotate([0,0,150])
translate([-BT60_OR - BT50_OR, 0, 0])
booster();

BT60(150);
translate([0,0,150])
Ogive_Cone(BT60_OD, 50, 1, 5);
