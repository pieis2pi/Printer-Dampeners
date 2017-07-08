dampener_height = 2;
motor_size = 42;
chamfer = 4;
screw_spacing = 31/2;
screw_diameter = 3;
center_circle = 23;

dampener();

module base_shape(){
    difference(){
        cube([motor_size,motor_size,dampener_height],center=true);
        union(){
            linear_extrude(height=dampener_height+1,
                            center=true,
                            convexity=10)
                polygon(points=[[motor_size/2-chamfer-1,motor_size/2+1],
                                [motor_size/2+1,motor_size/2-chamfer-1],
                                [motor_size/2+1,motor_size/2+1]],
                        convexity=10);
            linear_extrude(height=dampener_height+1,
                            center=true,
                            convexity=10)
                polygon(points=[[motor_size/2-chamfer-1,-motor_size/2-1],
                                [motor_size/2+1,-motor_size/2+chamfer+1],
                                [motor_size/2+1,-motor_size/2-1]],
                        convexity=10);
            linear_extrude(height=dampener_height+1,
                            center=true,
                            convexity=10)
                polygon(points=[[-motor_size/2+chamfer+1,motor_size/2+1],
                                [-motor_size/2-1,motor_size/2-chamfer-1],
                                [-motor_size/2-1,motor_size/2+1]],
                        convexity=10);
            linear_extrude(height=dampener_height+1,
                            center=true,
                            convexity=10)
                polygon(points=[[-motor_size/2+chamfer+1,-motor_size/2-1],
                                [-motor_size/2-1,-motor_size/2+chamfer+1],
                                [-motor_size/2-1,-motor_size/2-1]],
                        convexity=10);}}
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