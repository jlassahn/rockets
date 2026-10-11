
module Ogive_Cone(diameter, length, thickness, cap_d)
{
    inset_r = diameter/2 - cap_d/2;
    inset_l = length - cap_d/2;

    // curvature radius of an ogive:
    inset_r_curve = inset_r/2 + inset_l*inset_l/(inset_r*2);    
    angle = asin(inset_l / inset_r_curve);
    r_curve = inset_r_curve + cap_d/2;

    rotate_extrude($fn=64)
    intersection()
    {
        union()
        {
            translate([inset_r - inset_r_curve, 0, 0]) 
            {
                difference()
                {
                    circle(r = r_curve, $fn=512);
                    circle(r = r_curve-thickness, $fn=512);
                    rotate([0,0,angle]) square(r_curve);
                }
            }

            if (cap_d > 0)
            {
                translate([0,inset_l,0])      
                rotate([0,0,angle])
                intersection()
                {
                    difference()
                    {
                        circle(d = cap_d, $fn = 32);
                        if (cap_d > 2*thickness)
                            circle(d = cap_d - 2*thickness, $fn=32);
                    }
                    translate([0,-0.1,0])square(cap_d);
                }
            }
        }
        square(length + diameter);
    }
}

module Ogive_Transition(diameter1, diameter2, length, thickness)
{
    R1 = diameter1/2;
    R2 = diameter2/2;
    dR = R1 - R2;
    R = (dR*dR + length*length)/(2*dR);
    
    rotate_extrude()
    intersection()
    {
        translate([R1 - R, 0, 0])
        circle(r = R);
        
        square(size = [R1, length]);
    }
}

//Ogive_Cone(diameter=33.655, length=137, thickness=0.4, cap_d=2);
//Ogive_Transition(diameter1=20, diameter2=10, length=20, thickness=1);

