use </home/blaise/source/rcolyer/threads-scad/threads.scad>

inch = 25.4;
thickness = 5;


module MyHole(x, y){
    translate([x,y,-thickness/2]){
  ScrewThread(inch/4,5,pitch=inch/20);
    }
}

module MyRow(x){
  for (y=[-3:3]) MyHole(x, y*inch);
}

difference(){
cube([4*inch, 4*inch, thickness],
       center=true);
for (x=[-3:3]) MyRow(x*inch);
}
