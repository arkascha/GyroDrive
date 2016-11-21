module HarddriveFixation() {

  module flapSquareHole(length,height) {
    cube([length,4,height]);
  }

  module flapDrilledHole() {
    cylinder(h=4,d=5,center=true);
  }

  module flapOvalHole(radius,length) {
    union() {
      translate([-(length-2*radius)/2,0,0]) cylinder(h=4,r=radius,center=true);
      translate([+(length-2*radius)/2,0,0]) cylinder(h=4,r=radius,center=true);
      cube([length-2*radius,2*radius,4],center=true);
    }
  }
  
  module flapBody() {
    // base flap
    translate([0,1,0]) cube([145,22,2]);
    // two round edges
    for(x=[1,23])
      rotate([0,90,0]) translate([-1,x,0]) cylinder(h=145,d=2);
    // low side flap
    translate([0,24,1]) rotate([90,0,0]) cube([145,23,2]);
    // high side flap
    translate([0,2,1]) rotate([90,0,0]) cube([145,39,2]);
  }

  translate([-72.5,-12,-12]) {
    difference() {
      // flap body
      color("whitesmoke") flapBody();
      // square holes in base flap
      translate([ 8,-1,-1]) flapSquareHole(8,5);
      translate([129,-1,-1]) flapSquareHole(8,5);
      // drill holes in base flap
      translate([ 12,7,1]) flapDrilledHole();
      translate([133,7,1]) flapDrilledHole();
      // two times two oval gaps in lower side
      translate([100,23,17]) rotate([90,0,0]) flapOvalHole(3,50);
      translate([118,23,12]) rotate([90,90,0]) flapOvalHole(3,15);
      translate([ 45,23,17]) rotate([90,0,0]) flapOvalHole(3,50);
      translate([28,23,12]) rotate([90,90,0]) flapOvalHole(3,15);
      // two oval gaps
      translate([100,1,21]) rotate([90,0,0]) flapOvalHole(10,50);
      translate([ 45,1,21]) rotate([90,0,0]) flapOvalHole(10,50);
      // four drillings
      translate([ 12,1,31]) rotate([90,0,0]) flapDrilledHole();
      translate([ 12,1,11]) rotate([90,0,0]) flapDrilledHole();
      translate([133,1,31]) rotate([90,0,0]) flapDrilledHole();
      translate([133,1,11]) rotate([90,0,0]) flapDrilledHole();
    }
  }
}

HarddriveFixation();