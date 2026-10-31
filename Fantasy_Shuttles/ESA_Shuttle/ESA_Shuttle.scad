$fa = 1;
$fs = 0.5;
$fn = 0;


include <../../Printed_Parts/Rocket_Constants.scad>
use <../../Printed_Parts/Tubes.scad>
use <../../Printed_Parts/Skew_Cone.scad>
use <../../Printed_Parts/Ogive_Cone.scad>


module large_engine()
{
    difference()
    {
        scale([1,1,1.2])sphere(10);
        scale([1,1,1.2])sphere(9);
        translate([0,0,-10])
        cube([20, 20, 20], center = true);
    }
}

module booster()
{
    translate([0,0,5])
    BT50(95);
    
    translate([0,0,100])
    Skew_Cone(BT50_OD, 60, 1, 5);
   
    translate([0,0,5])
    scale([BT50_OR/10, BT50_OR/10, 0.5])
    sphere(r=10);
    translate([0,0,-3])large_engine();
}

module small_engine()
{
    difference()
    {
        scale([1,1,1.5])sphere(8);
        scale([1,1,1.5])sphere(7);
        translate([0,0,-10])
        cube([20, 20, 20], center = true);
    }
}

module rear()
{
    translate([0,0,10])
    difference()
    {
        union()
        {
            scale([BT60_OR/10, BT60_OR/10, 1])
            sphere(r=10);
            translate([14, 0, -13])small_engine();
            translate([-14, 0, -13])small_engine();
            translate([0, 14, -13])small_engine();
            translate([0, -14, -13])small_engine();
        }
        scale([BT60_OR/10 - 0.1, BT60_OR/10 - 0.1, 0.9])
        sphere(r=10);        
        cylinder(20, 40, 40);
        cylinder(40, r=11, center = true);
    }
 
    //cylinder(10, 15, BT60_OR);
}

module body()
{
    translate([0,0,10])
    BT60(250);

    translate([0,0,260])
    Ogive_Cone(BT60_OD, 75, 1, 8);
}

module fin()
{
    rotate([0,90,0])
    linear_extrude(1.58,center=true)
    polygon([[0,0],[24,36],[48,36],[48,0]]);
}

module tail_fin()
{
    rotate([0,90,0])
    linear_extrude(1.58,center=true)
    polygon([[-20,0], [4.8,7.2],[24,36],[48,36],[48,0], [51,-5]]);
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
    Ogive_Transition(BT20_OD, 10, 53, 1);

    wing();
    mirror([1,0,0]) wing();

    translate([0,BT20_OR,48])
    tail_fin();
}

module engine()
{
    cylinder(h=70, r = 9);
}

rear();
translate([0,0,2])BT20(70);
translate([0,0,-3]) engine();


translate([0, BT60_OR + BT20_OR + 3, 0])
orbiter();

//color(c = [0,0,0,.5])
stack();

