
module Skew_Cone(diameter, length, thickness, cap_d)
{
    R1 = diameter/2;
    R2 = cap_d/2;
    R3 = R1/2;

    hull()
    {
        translate([R1-R2,0,length-R2])
        sphere(r=R2);

        rotate_extrude()
        intersection()
        {
            square(R1+R3);
            translate([R1-R3,0,0])
            circle(r=R3);
        }
    }
}

//SkewCone(20, 30, 1, 5);
