use <HarddriveEnclosure.scad>
use <HarddriveFixation.scad>
use <PermanentMagnet.scad>
use <EffectorStanchion.scad>
use <ActorBar.scad>

module Effector(north) {
  // hard drive enclosure
  HardDriveEnclosure();
  // two hard drive fixations
  rotate([180,0,0]) translate([0,-62,0]) HarddriveFixation();
  mirror([1,0,0]) rotate([0,180,0]) translate([0,-62,0]) HarddriveFixation();
  // the neobdyn magnets
  for(y = [-30:30:30]) {
    rotate([180,0,0]) translate([-60,y,12]) PermanentMagnet(14,5,3.5,6.7,north,true);
  }
  // the four motion stanchions
  for(a=[-1,1])
    translate([a*59,73,0]) rotate([180+a*90,-sin($t*360)*5+a*56+90,0]) EffectorStanchion(143);
}

module EffectorBox() {
  // upper effector
  rotate([0,sin($t*360)*5,0]) translate([0,0,40]) Effector(true);
  // lower effector
  rotate([0,-sin($t*360)*5,0]) translate([0,0,-40]) rotate([180,0,0]) Effector(false);
  // bar holding actors
  translate([-60,0,0]) ActorBar();
}

EffectorBox();