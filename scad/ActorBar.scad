use <ElectroMagnet.scad>

module ActorBar() {
  // the bar body
  difference() {
    color("darkgreen") {
      cube([10,120,6],center=true);
      for(y=[-30:30:30])
        translate([0,y,0]) cylinder(h=6,d=26,center=true);
    }
    for(y=[-30:30:30])
      translate([0,y,0]) cylinder(h=6.02,d=20,center=true);
  }
  // the electro magnets
  for(y=[-30:30:30])
    rotate([180,0,0]) translate([0,y,0]) ElectroMagnet(20,14);
}

ActorBar();