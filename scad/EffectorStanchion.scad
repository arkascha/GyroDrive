module EffectorStanchion(numberOfAxis,lengthOfBeam,distanceOfFixpoint=1,widthOfFixpoint=2) {

  module axisDisk() {
    color("dimgray") cylinder(h=0.5,r=4,center=false);
  }
  
  module axisBody(x) {
    translate([x,0,-1.75]) color("darkred") cylinder(h=3.5+distanceOfFixpoint+widthOfFixpoint,r=3,center=false);
    // beam axis end disks
    for(z=[-1.5,1,.5+distanceOfFixpoint])
      translate([x,0,z]) axisDisk();
    translate([x,0,1+distanceOfFixpoint+widthOfFixpoint]) axisDisk();
  }

  translate([lengthOfBeam/2,0,-(2+widthOfFixpoint/2)]) {
    // main beam
    color("lightgray") cube([lengthOfBeam,10,2],center=true);
    // beam endings
    for(x=[-lengthOfBeam/2,lengthOfBeam/2])
    translate([x,0,0]) color("lightgray") cylinder(h=2,r=5,center=true);
    // beam axes
    if(numberOfAxis==2) {
      for(x=[-lengthOfBeam/2,lengthOfBeam/2]) {
        axisBody(x);
      }
    } else if (numberOfAxis==1) {
      x=-lengthOfBeam/2;
      axisBody(x);
    }
  }
}

EffectorStanchion(2,130);
translate([0,0,-20]) EffectorStanchion(1,130);
translate([0,0,-40]) EffectorStanchion(0,130);
translate([0,20,-2]) EffectorStanchion(2,130,3);
translate([0,40,0]) EffectorStanchion(2,130,1,4);
translate([0,60,-2]) EffectorStanchion(2,130,3,4);
