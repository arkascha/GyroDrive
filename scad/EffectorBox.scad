use <HarddriveEnclosure.scad>
use <HarddriveFixation.scad>
use <PermanentMagnet.scad>
use <EffectorStanchion.scad>
use <ActorBar.scad>

module EffectorBearing() {
  // the axis
  rotate([90,0,0]) color("lightgreen") cylinder(h=142,r=4,center=true);
  color("darkgreen") {
    for(r=[0,1]) mirror([r,1-r,0]) {
      // axis holder alength
      translate([0,60,0]) {
        cube([220,2,10],center=true);
        rotate([90,0,0]) cylinder(h=2,r=10,center=true);
      }
      // axis holder across
      rotate([0,0,90]) translate([0,110,0]) {
        difference() {
          union() {
            cube([122,2,10],center=true);
            rotate([90,0,0]) cylinder(h=2,r=10,center=true);
          }
          rotate([90,0,0]) cylinder(h=2.02,r=5,center=true);
        }
      }
    }
  }
}

module Effector(north) {
  // hard drive enclosure
  HardDriveEnclosure();
  // the neobdyn magnets
  for(y = [-30:30:30]) {
    rotate([180,0,0]) translate([-60,y,12]) PermanentMagnet(14,5,3.5,6.7,north,true);
  }
  // two hard drive fixations
  rotate([180,0,0]) translate([0,-62,0]) HarddriveFixation();
  mirror([1,0,0]) rotate([0,180,0]) translate([0,-62,0]) HarddriveFixation();
  // the four moving stanchions
  translate([+59,73,0]) rotate([180-90,-sin($t*360)*5+56+90,0]) EffectorStanchion(2,143,1,2);
  translate([-59,76,0]) rotate([180-90,-sin($t*360)*5-56+90,0]) EffectorStanchion(2,143,4,2);
  // the four fixed stanchions
  translate([+60,69,-20]) rotate([-90,161.5,0]) EffectorStanchion(1,64,5,2);
  translate([-60,72,-20]) rotate([-90,18.5,0]) EffectorStanchion(1,64,2,2);
}

module EffectorBox() {
  // upper effector
  rotate([0,sin($t*360)*5,0]) translate([0,0,40]) Effector(true);
  // lower effector
  rotate([0,-sin($t*360)*5,0]) translate([0,0,-40]) rotate([180,0,0]) Effector(false);
  // effector bearing
  EffectorBearing();
  // bar holding actors
  translate([-60,0,0]) ActorBar();
}

EffectorBox();