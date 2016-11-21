module EffectorStanchion(length) {
  translate([length/2,0,-3.5]) {
    // main beam
    color("lightgray") cube([length,10,2],center=true);
    for(x=[-length/2,length/2]) {
      // beam endings
      translate([x,0,0]) color("lightgray") cylinder(h=2,r=5,center=true);
      // beam axes
      translate([x,0,2.5]) color("darkred") cylinder(h=8,r=3,center=true);
      // beam axis disks
      for(z=[1.5,5.5])
        translate([x,0,z]) color("dimgray") cylinder(h=1,r=4,center=true);
    }
  }
}

EffectorStanchion(130);