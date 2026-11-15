
include <../../Printed_Parts/Rocket_Constants.scad>

_balsa_color = [.85,.8,.65,1];

// _pod_r matches the radius of curvature of the 3D printed
// wingtip pods.
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

module fin()
{
    color(_balsa_color)
    rotate([90,0,0])
    linear_extrude(1.58, center=true)
    _fin_outline();
}

module wing()
{
    color(_balsa_color)
    rotate([90,0,0])
    linear_extrude(1.58, center=true)
    _wing_outline();
}

module elevon(trim)
{
    color(_balsa_color)
    translate([0,0,50])
    rotate([0,_elevon_angle,0])
    rotate([trim,0,0])
    rotate([0,-_elevon_angle,0])
    translate([0,0,-50])

    rotate([90,0,0])
    linear_extrude(1.58, center=true)
    _elevon_outline();
}

module canard()
{
    color(_balsa_color)
    rotate([90,0,0])
    linear_extrude(1.58, center=true)
    difference()
    {
        square([30, 70]);
        translate([30,0])scale([1,0.40])circle(r=30);
        translate([60,70])scale([1,0.75])circle(r=60);
    }
}

