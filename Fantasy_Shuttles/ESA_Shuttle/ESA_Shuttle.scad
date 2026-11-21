$fa = 1;
$fs = 0.5;
$fn = 0;

explode = 30;


include <../../Printed_Parts/Rocket_Constants.scad>
use <../../Printed_Parts/Tubes.scad>
use <Balsa_Parts.scad>
use <Printed_Parts.scad>

module booster()
{
    translate([0,0,5])
    BT50(95);
    
    translate([0,0,100+explode])
    booster_nose(); 
    
    translate([0,0,-explode])
    booster_tail();
}

module body()
{
    translate([0,0,10])
    BT60(250);

    translate([0,0,260+explode])
    main_nose();
}

module stack()
{
    body();

    rotate([0,0,30])
    translate([-BT60_OR - BT50_OR - explode, 0, 0])
    booster();

    rotate([0,0,150])
    translate([-BT60_OR - BT50_OR - explode, 0, 0])
    booster();

    rotate([0,0,120])
    translate([0,BT60_OR + BT50_OD + 2*explode,48])
    fin();

    rotate([0,0,-120])
    translate([0,BT60_OR + BT50_OD + 2*explode,48])
    fin();

    translate([0,0,-explode])
    main_tail();
    
    translate([0,0,2])
    BT20(70);
}

module orbiter()
{
    translate([0, 0, 50])
    BT20(80);

    translate([0,0,130+explode])
    orbiter_nose();

    translate([0,0,50-explode])
    rotate([180,0,0])
    orbiter_tail();

    translate([BT20_OR+explode,0, 10])
    wing();
    
    mirror([1,0,0])
    translate([BT20_OR+explode,0, 10])
    wing();

    translate([0,BT20_OR+explode,48-explode])
    tail_fin();
}

module engine()
{
    cylinder(h=70, r = 9);
}

translate([0,0,-3]) engine();


translate([0, BT60_OR + BT20_OR + 3 + explode, 0])
orbiter();

//color(c = [0,0,0,.5])
stack();

