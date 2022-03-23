inch = 25.4;
length = 3 * inch;
width = 0.75 * inch;
height = 2;
hole_diameter = 0.26 * inch;

linear_extrude(height=height) {
difference() {
    union() {
translate([length / 2, 0, 0]){
circle(r=width/2);
};

translate([-length / 2, 0, 0]){
circle(r=width/2);
};

square([length, width], center=true);
};
union() {
    translate([length / 2, 0, 0]){
circle(r=hole_diameter/2);
}

    translate([-length / 2, 0, 0]){
circle(r=hole_diameter/2);
}


}
}
}