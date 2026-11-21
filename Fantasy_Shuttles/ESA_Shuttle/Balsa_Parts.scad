
module fin()
{
    rotate([0,90,0])
    linear_extrude(1.58,center=true)
    polygon([[0,0],[24,36],[48,36],[48,0]]);
}

module wing()
{
    translate([0,0,120])
    rotate([0,0,-90])
    rotate([0,90,0])
    linear_extrude(1.58,center=true)
    polygon([[0,0], [50,15], [90,55],[105,55],[120,0]]);
}

module tail_fin()
{
    rotate([0,90,0])
    linear_extrude(1.58,center=true)
    polygon([[-20,0], [4.8,7.2],[24,36],[48,36],[48,0], [51,-5]]);
}
