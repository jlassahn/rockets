
include <../../Printed_Parts/Rocket_Constants.scad>
use <../../Printed_Parts/Ogive_Cone.scad>

module pod()
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

module orbiter_tail()
{
    Ogive_Transition(BT20_OD, 12, 30, 1);
}

module orbiter_nose()
{
    Ogive_Cone(BT20_OD, 80, 1, 3);
}

module booster_nose()
{
    Ogive_Cone(BT60_OD, 150, 1, 3);
}
module booster_tail()
{
    Ogive_Transition(BT60_OD, BT20_OD, 100, 1);
}
