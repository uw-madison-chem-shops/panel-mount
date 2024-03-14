use <MCAD/teardrop.scad>

$fn=50;
inch = 25.4;

module myhole() {
  rotate([0, 0, 90]) {
    teardrop(radius=0.255*inch/2, length=20, angle=90);
  }
}


difference() {
    
translate([-1*inch,0,0])
cube([2*inch, 4*inch, 3]);
    
linear_extrude(6)
scale([inch, inch, 0])
translate([0,3,-3])
import("./cutout.dxf");


}

difference() {

translate([-1*inch, 0, 0]) 
cube([2*inch, 3, 1*inch]);

union() {
   
translate([-0.5*inch, 0, 0.5*inch])
myhole();
    
translate([0.5*inch, 0, 0.5*inch])
myhole();

}
}