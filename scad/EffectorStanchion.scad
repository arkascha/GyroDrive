use <RivetAxis.scad>

module EffectorStanchion(numberOfAxis,lengthOfBeam,distanceOfFixpoint=1,widthOfFixpoint=2) {

  translate([lengthOfBeam/2,0,-(2+widthOfFixpoint/2)]) {
    // main beam body
    color("lightgray") cube([lengthOfBeam,10,2],center=true);
    // round beam endings
    for(x=[-lengthOfBeam/2,lengthOfBeam/2])
      translate([x,0,0]) color("lightgray") cylinder(h=2,r=5,center=true);
    // beam axes
    if(numberOfAxis==2) {
      for(x=[-lengthOfBeam/2,lengthOfBeam/2]) {
        translate([x,0,0]) RivetAxis(6,distanceOfFixpoint,widthOfFixpoint);
      }
    } else if (numberOfAxis==1) {
      x=-lengthOfBeam/2;
      translate([x,0,0]) RivetAxis(6,distanceOfFixpoint,widthOfFixpoint);
    }
  }
}

EffectorStanchion(2,130);
translate([0,0,-20]) EffectorStanchion(1,130);
translate([0,0,-40]) EffectorStanchion(0,130);
translate([0,20,-2]) EffectorStanchion(2,130,3);
translate([0,40,0]) EffectorStanchion(2,130,1,4);
translate([0,60,-2]) EffectorStanchion(2,130,3,4);
