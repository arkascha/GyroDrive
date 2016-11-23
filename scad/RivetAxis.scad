module RivetAxis(diameterOfAxis=6,distanceOfFixpoint=2,widthOfFixpoint=2) {

  factorDiameterOfAxisAndDisk = 1.5;
  
  module axisDisk(diameterOfDisk) {
    color("dimgray") cylinder(h=0.5,d=diameterOfDisk,center=false);
  }
  
  module axisBody(diameterOfAxis,distanceOfFixpoint,widthOfFixpoint) {
    color("darkred")
      translate([0,0,-1.75])
        cylinder(h=3.5+distanceOfFixpoint+widthOfFixpoint,d=diameterOfAxis,center=false);
  }

  // beam axis
  axisBody(diameterOfAxis,distanceOfFixpoint,widthOfFixpoint);
  // beam axis end disks
  for(z=[-1.5,1,.5+distanceOfFixpoint])
    translate([0,0,z]) 
      axisDisk(factorDiameterOfAxisAndDisk*diameterOfAxis);
  translate([0,0,1+distanceOfFixpoint+widthOfFixpoint]) 
    axisDisk(factorDiameterOfAxisAndDisk*diameterOfAxis);
}

translate([0,  0,0]) RivetAxis(4);
translate([0, 20,0]) RivetAxis(4,4);
translate([0, 40,0]) RivetAxis(6,4,2);
translate([0, 60,0]) RivetAxis(6,6,2);
translate([0, 80,0]) RivetAxis(6,6,6);
translate([0,100,0]) RivetAxis(10,2,2);
