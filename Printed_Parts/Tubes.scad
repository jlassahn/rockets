
include <Rocket_Constants.scad>

tube_color = [1,.8,.7,1];
module BT20(length)
{
    color(c = tube_color)
    difference()
    {
        cylinder(h=length, r=BT20_OR);
        translate([0,0,-0.1])cylinder(h=length+0.2, r=BT20_IR);
    }
}

module BT50(length)
{
    color(c = tube_color)
    difference()
    {
        cylinder(h=length, r=BT50_OR);
        translate([0,0,-0.1])cylinder(h=length+0.2, r=BT50_IR);
    }
}

module BT60(length)
{
    color(c = tube_color)
    difference()
    {
        cylinder(h=length, r=BT60_OR);
        translate([0,0,-0.1])cylinder(h=length+0.2, r=BT60_IR);
    }
}
