$fn=50;
inch = 25.4;

// center to center dimensions
mw = 4*inch;  // mounting width
mh = 3*inch;  // mounting width
bw = 60;  // board width
bh = 50;  // board height

// hole diameters
md = 0.28*inch;  // mounting hole diameter
bd = 0.15*inch;  // board hole diameter

module roundedRect(size, radius) {
  x = size[0];
  y = size[1];  // what was I thinking again??

  z = size[2];
  linear_extrude(height=z)
  hull() {
    // place 4 circles in the corners, with the given radius
    translate([(-x/2)+radius, (-y/2)+radius, 0])
    circle(r=radius);
    translate([(x/2)-radius, (-y/2)+radius, 0])
    circle(r=radius);
    translate([(-x/2) + radius, (y/2)-radius, 0])
    circle(r=radius);
    translate([(x/2)-radius, (y/2)-radius, 0])
    circle(r=radius);
  }
}

module counterSunk(position, radius) {
  union() {
    translate(position)
    union() {
      cylinder(3, radius, radius, 8, center=false);
      cylinder(3, 0, 3.5, center=false);
    }
  }
}

// plate itself
difference() {
  // positive rectangle
  roundedRect([mw + 0.5*inch, mh + 0.5*inch, 3], 5, center=false);
  // four table mounting holes
  translate([-mw/2, -mh/2, 0])
  cylinder(3, md/2, md/2, 8, center=false);
  translate([-mw/2, mh/2, 0])
  cylinder(3, md/2, md/2, 8, center=false);  
  translate([mw/2, -mh/2, 0])
  cylinder(3, md/2, md/2, 8, center=false);  
  translate([mw/2, mh/2, 0])
  cylinder(3, md/2, md/2, 8, center=false);
  // four board holes
  union() {
    counterSunk([bw/2, bh/2, 0], bd/2);
    counterSunk([-bw/2, bh/2, 0], bd/2);
    counterSunk([bw/2, -bh/2, 0], bd/2);
    counterSunk([-bw/2, -bh/2, 0], bd/2);
  }
  // negative cutouts
  linear_extrude(height=5)
  offset(r=3){
    offset(r=-6){
      union(){
        square([mw,bh-0.5*inch], center=true);
        square([bw-0.5*inch,mh], center=true);
      }
    }
  }
}






