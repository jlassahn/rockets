$fa = 1;
$fs = 0.5;
$fn = 0;

explode = 30;

include <../../Printed_Parts/Rocket_Constants.scad>
use <../../Printed_Parts/Tubes.scad>
use <Balsa_Parts.scad>
use <Printed_Parts.scad>

module wing_assembly()
{
    wing();
    
    translate([0,0,-explode])
    elevon(15);
    
    translate([explode, 0, 0])
    pod();
}

module orbiter()
{
    mirror([1,0,0])
    rotate([0,0,15])
    translate([BT20_OR + explode, 0, 0])
    wing_assembly();

    rotate([0,0,15])
    translate([BT20_OR + explode, 0, 0])
    wing_assembly();

    //translate([0,0,50]) BT20(150);
    translate([0,0,50]) BT20(130);

    translate([0,0,50-explode])
    rotate([180,0,0])
    orbiter_tail();

    //translate([0,0,200])
    translate([0,0,180+explode])
    orbiter_nose();

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
    translate([0,0,320+explode])
    booster_nose();

    translate([0,0,120])
    BT60(200);

    translate([0,0,20-explode])
    BT20(120);

    translate([0,0,120-4*explode])
    rotate([180,0,0])
    booster_tail();

    rotate([0,0,-90])
    translate([BT20_OR+explode, 0, -explode])
    {
        fin();
        
        translate([explode,0,0])
        pod();
    }
}

translate([0, BT60_OR + BT20_OR + 3 + explode, 0])
orbiter();

booster();
