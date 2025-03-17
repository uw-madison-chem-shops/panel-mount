use <MCAD/teardrop.scad>

$fn=50;
inch = 25.4;
width = 2.5*inch;

difference() {
  
  translate([-width/2, 0, 0])
  cube([width, 3*inch, 3]);
    
union(){
  translate([0, 2*inch, 0])
    linear_extrude(5)
      scale([inch, inch, 0])
        import("./DB25.dxf");
}

}

module myhole() {
  rotate([0, 0, 90]) {
    teardrop(radius=0.255*inch/2, length=20, angle=90);
  }
}

difference() {

translate([-width/2, 0, 0]) 
cube([width, 3, 1*inch]);

union() {
   
translate([-0.5*inch, 0, 0.5*inch])
myhole();

translate([0.5*inch, 0, 0.5*inch])
myhole();

}
}