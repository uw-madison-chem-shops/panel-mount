$fn=50;
inch = 25.4;

linear_extrude(3)
scale([inch, inch, 0]) 
import("./switchcraft.dxf");

difference() {

translate([-1*inch, 0, 0]) 
cube([2*inch, 3, 1*inch]);

union() {
   
translate([-0.5*inch, 0, 0.5*inch])
rotate([90, 0, 0])
cylinder(10, 0.13*inch, 0.13*inch, center=true);

translate([0.5*inch, 0, 0.5*inch])
rotate([90, 0, 0])
cylinder(10, 0.13*inch, 0.13*inch, center=true);

}
}