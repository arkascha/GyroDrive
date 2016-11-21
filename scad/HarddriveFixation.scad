module HarddriveFixation() {
$fn=100;
  module flapSquareHole(length,height,orientation) {
    cube([length,height*2,height*2],center=true);
    translate([orientation*3.5,2,0]) cube([2,height*2,height*2],center=true);
  }

  module flapDrilledHole() {
    cylinder(h=4,d=3,center=true);
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
    translate([0,1,0]) cube([95,20,1]);
    // low side flap
    translate([0,22,1]) rotate([90,0,0]) cube([95,16,1]);
    // high side flap
    translate([0,1,1]) rotate([90,0,0]) cube([95,24,1]);
    // two round edges
    difference() {
      // outer round surface
      union() {
        for(x=[1,21])
          rotate([0,90,0]) translate([-1,x,0]) cylinder(h=95,d=2);
      }
      // inner round surfaces
      rotate([0,90,0]) translate([-2,2,-1]) cylinder(h=97,d=2);
      rotate([0,90,0]) translate([-2,20,-1]) cylinder(h=97,d=2);
    }
  }

  translate([-47.5,-22,0]) {
    difference() {
      // flap body
      color("whitesmoke") flapBody();
      // square holes in base flap
      translate([ 8,-1,-1]) flapSquareHole(9,4, 1);
      translate([86,-1,-1]) flapSquareHole(9,4,-1);
      // drill holes in base flap
      translate([ 7,5,1]) flapDrilledHole();
      translate([87,5,1]) flapDrilledHole();
      // two times two oval gaps in low side
      translate([25,21,11]) rotate([90, 0,0]) flapOvalHole(2,29);
      translate([17,21, 7]) rotate([90,90,0]) flapOvalHole(2,10);
      translate([69,21,11]) rotate([90, 0,0]) flapOvalHole(2,29);
      translate([77,21, 7]) rotate([90,90,0]) flapOvalHole(2,10);
      // two oval gaps in the high side
      translate([29,1,11]) rotate([90,0,0]) flapOvalHole(6,28);
      translate([65,1,11]) rotate([90,0,0]) flapOvalHole(6,28);
      // four drillings in the high side
      translate([ 7,1, 7]) rotate([90,0,0]) flapDrilledHole();
      translate([ 7,1,19]) rotate([90,0,0]) flapDrilledHole();
      translate([87,1, 7]) rotate([90,0,0]) flapDrilledHole();
      translate([87,1,19]) rotate([90,0,0]) flapDrilledHole();
    }
  }
}

HarddriveFixation();