module HardDriveEnclosure() {
  translate([-72.5,-50,-12]) {
    union() {
      // main body
      difference() {
        // metal box
        color("dimgray") cube([145,100,24]);
        // gap for connector block
        translate([136,-1,-1]) cube([10,102,10]);
        // screw holes 
        union() {
          // three holes on each side
          for (x = [15,75,117]) {
            // side 1
            translate([x,0,6]) rotate([90,0,0]) cylinder(h=6,r=2,center=true);
            // side 2
            translate([x,100,6]) rotate([90,0,0]) cylinder(h=6,r=2,center=true);
          }
        }
      }
      // connector block
      translate([136,1,0]) {
        difference() {
          // main body
          color("dimgray") cube([8,78,9]);
          // hols 'n gaps
          union() {
            // right pin hole
            translate([0,66,1]) cube([9,11,7]);
            // hole left of right pin hole
            translate([0,57,2]) cube([9,8,5]);
            // sata connectors
            translate([0,10,-1]) {
              difference() {
                // hole for sata connectors
                union() {
                  cube([9,37,6]);
                  translate([0,-1.9,2]) cube([9,2,2]);
                  translate([0,36.9,2]) cube([9,2,2]);
                }
                // bridges of sata connectors
                union() {
                  // sata data connector
                  union() {
                    translate([0,2,2]) cube([8,20,1]);
                    translate([0,21,1]) cube([8,1,1]);
                  }
                  // sata power connector
                  union() {
                    translate([0,25,2]) cube([8,10,1]);
                    translate([0,25,1]) cube([8,1,1]);
                  }
                }
              }
            }
          }
        }
      }
      // metal lid
      translate([0,0,24]) color("silver") cube([145,100,1]);
    }
  }
}

HardDriveEnclosure();