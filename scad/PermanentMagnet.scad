module PermanentMagnet(diameter, height, drilling, lowering, orientation, shim) {

  module polePlate(north) {
    if (north) {
      color("red") cylinder(h=.1,d=diameter,center=true);
    } else {
      color("black") cylinder(h=.1,d=diameter,center=true);
    }    
  }
  
  module pillShim(diameter) {
    color("white") cylinder(h=1,d=diameter);
  }

  module pillBody(diameter, height, drilling, lowering, orientation) {
    translate([0,0,height/2]) {
      difference() {
        union() {
          // body
          color("silver") cylinder(h=height-.2,d=diameter,center=true);
          // north plate
          translate([0,0,height/2-.1]) polePlate(orientation);
          // south plate
          rotate([180,0,0]) translate([0,0,height/2-.1]) polePlate(!orientation);
        }
        // drilling
        union() {
          // vertical drilling
          cylinder(h=height+.1,d=drilling,center=true);
          // conical drilling
          translate([0,0,height/4.0]) cylinder(h=height/2+.2,d1=drilling,d2=lowering,center=true);
        }
      }
    }
  }

  if (shim) {
    pillShim(diameter);
    translate([0,0,1]) pillBody(diameter, height, drilling, lowering, orientation);
  } else {
    pillBody(diameter, height, drilling, lowering, orientation);
  }
}

PermanentMagnet(14,5,3.5,6.7,false,true);