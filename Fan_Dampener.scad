dampener_height = 2;
fan_size = 40;
fillet = 3;
screw_spacing = 32/2;
screw_diameter = 3;
center_circle = 38;

dampener();

module base_shape(){
    linear_extrude(height=dampener_height,
                   center=true,
                   convexity=10)
        minkowski(){
            square([fan_size-2*fillet,fan_size-2*fillet],center=true);
            circle(r=fillet,$fn=20);}
}

module dampener(){
    difference(){
        base_shape();
        union(){
            cylinder(d=center_circle,h=dampener_height+1,center=true,$fn=60);
            translate([screw_spacing,screw_spacing,0])
                cylinder(d=screw_diameter,h=dampener_height+1,center=true,$fn=20);
            translate([screw_spacing,-screw_spacing,0])
                cylinder(d=screw_diameter,h=dampener_height+1,center=true,$fn=20);
            translate([-screw_spacing,screw_spacing,0])
                cylinder(d=screw_diameter,h=dampener_height+1,center=true,$fn=20);
            translate([-screw_spacing,-screw_spacing,0])
                cylinder(d=screw_diameter,h=dampener_height+1,center=true,$fn=20);}}
}