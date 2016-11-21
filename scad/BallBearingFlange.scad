module BallBearingFlange() {
  
  module Flange() {
    $fn=100;
    difference() {
      // body
      color("dimgrey") {
        // outer roundings
        for(x=[-16,16]) translate([x,0,0]) cylinder(h=3,r=5.2,center=true);
        // base plate
        for(x=[-1,0]) mirror([x,0,0])
          for(y=[-1,0]) mirror([0,y,0])
            rotate([0,0,19]) translate([-7.8,5.35,0]) cube([16,10,3],true);
        // inner rounding
        translate([0,0,0]) cylinder(h=3,r=10.4,center=true);
        // raised ring
        translate([0,0,2]) cylinder(h=7,r=10,center=true);
      }
      // two outer clamp drillings
      for(x=[-16,16]) translate([x,0,0]) cylinder(h=3.02,r=2.5,center=true);
      // the inner drilling holding the bearing
      translate([0,0,2]) cylinder(h=7.02,r=8.4,center=true);
    }
  }
  
  module BallBearing() {
    $fn=100;
    // outer steel tube
    difference() {
      color("silver") cylinder(h=6.6,r=8.6,center=true);
      cylinder(h=6.62,r=8.0,center=true);
    }
    // pillow ring
    difference() {
      color("black") cylinder(h=6.2,r=8.0,center=true);
      cylinder(h=6.22,r=5.2,center=true);
    }
    // inner steel tube
    translate([0,0,2]) {
      difference() {
        color("silver") cylinder(h=10.5,r=5.2,center=true);
        cylinder(h=10.52,r=4.0,center=true);
        // three drillings for fixing bolts
        for(x=[-120,0,120])
          rotate([0,0,x]) 
          translate([4,0,3]) 
            rotate([0,90,0]) 
                translate([0,0,0.7]) cylinder(h=2,r=1.05,center=true);
      }
    }
    // three fixing bolts
    for(x=[-120,0,120])
      rotate([0,0,x]) 
        translate([4.7,0,5]) 
          rotate([0,90,0]) 
            difference() {
              color("black") {
                // main body
                cylinder(h=2,r=1,center=true);
                // inner tip
                translate([0,0,-1.25]) cylinder(h=.5,r1=.2,r2=1,center=true);
              }
              // drilling
              translate([0,0,0.7]) cylinder(h=1,r=0.7,center=true);
            }
  }

  translate([0,0,2]) {
    Flange();
    translate([0,0,2]) BallBearing();
  }
}

BallBearingFlange();