module ElectroMagnet(diameter, height) {
  $fn=100;

  // steel core
  color("silver") translate([0,0,0.1*height]) cylinder(h=0.8*height,d=0.4*diameter,center=true);
  // black wrapping
  difference() {
    color("black") cylinder(h=0.96*height,d=0.9*diameter,center=true);
    cylinder(h=1.02*height,d=0.4*diameter,center=true);
  }
  // steel shell
  difference() {
    // shell body
    color("silver") cylinder(h=1*height,d=1*diameter,center=true);
    // empty core
    translate([0,0,0.05*height]) cylinder(h=1*height,d=0.9*diameter,center=true);
    // bottom drilling
    translate([0,0,-0.46*height]) cylinder(h=0.1*height,d=0.1*diameter,center=true);
  }
}

ElectroMagnet(20,14);