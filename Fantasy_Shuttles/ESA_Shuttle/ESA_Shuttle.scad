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

translate([0,0,10])
BT60(200);

translate([0,0,210])
Ogive_Cone(BT60_OD, 100, 1, 5);

translate([0,BT60_OR + BT20_OR, 50])
BT20(100);

translate([0,BT60_OR + BT20_OR,150])
Ogive_Cone(BT20_OD, 80, 1, 3);

translate([0,BT60_OR + BT20_OR,50])
rotate([180,0,0])
Ogive_Transition(BT20_OD, 10, 60, 1);

module wing()
{
    translate([-BT20_OR,BT60_OR + BT20_OR, 115])
    rotate([0,0,90])
    rotate([0,90,0])
    linear_extrude(1.58,center=true)
    polygon([[0,0], [40,15], [75,50],[95,50],[105,0]]);
}

wing();
mirror([1,0,0]) wing();

module fin()
{
    rotate([0,90,0])
    linear_extrude(1.58,center=true)
    polygon([[0,0],[20,30],[40,30],[40,0]]);
}

rotate([0,0,120])
translate([0,BT60_OR + BT50_OD,40])
fin();

rotate([0,0,-120])
translate([0,BT60_OR + BT50_OD,40])
fin();

translate([0,BT60_OR + BT20_OD,40])
fin();
