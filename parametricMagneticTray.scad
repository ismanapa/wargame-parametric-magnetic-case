//Platform X
platformX = 150;

//Platform Y
platformY = 150;

//Base Diameter
baseDiamater = 32;

//Base separation X
baseSeparationX = 5;

//Base separation Y
baseSeparationY = 5;

//Platform margin
platformPadding = 10;

module makeTray(widthX, widthY) {

    //X Axis calculations
    baseNumberX = floor((widthX - platformPadding*2 + baseSeparationX) / (baseDiamater + baseSeparationX));
    availableSpaceX = ((widthX - platformPadding*2) - (baseNumberX * baseDiamater));
    finalSeparationX = availableSpaceX > 0 ? ( baseNumberX > 1 ? availableSpaceX / (baseNumberX - 1) : availableSpaceX) : 0;

    echo(availableSpaceX);
    echo("<h1>SPACE BETWEEN BASES X", finalSeparationX, "</h1>");

    //Y Axis calculations
    baseNumberY = floor((widthY - platformPadding*2 + baseSeparationY) / (baseDiamater + baseSeparationY));
    availableSpaceY = ((widthY - platformPadding*2) - (baseNumberY * baseDiamater));
    finalSeparationY = availableSpaceY > 0 ? ( baseNumberY > 1 ? availableSpaceY / (baseNumberY - 1) : availableSpaceY) : 0;


    echo("<h1>SPACE BETWEEN BASES Y", finalSeparationY, "</h1>");

     module makeBase(ix, iy) {
        translate([ 
            ((platformPadding + baseDiamater/2) + (ix * (baseDiamater + finalSeparationX)) ), 
            ((platformPadding + baseDiamater/2) + (iy * (baseDiamater + finalSeparationY)) ),
            2
        ]) {
            cylinder(r=baseDiamater/2, h=8,$fn=100);
        }
    }

    difference() {
        cube([widthX, widthY, 4]);
        
        if (baseNumberY > 0 && baseNumberX > 0) {
            for (ix = [0:baseNumberX-1])
                for(iy = [0:baseNumberY-1])
                    makeBase(ix, iy);
        }

        translate([-1, 0, 2]) {
            rotate([0, 90, 0]) {
                translate([0, widthY/3, 0]) {
                    cylinder(r=1, h=platformPadding, $fn=100);
                }

                translate([0, widthY/3*2, 0]) {
                    cylinder(r=1, h=platformPadding, $fn=100);
                }
            }
        }

        translate([widthX - platformPadding + 1, 0, 2]) {
            rotate([0, 90, 0]) {
                translate([0, widthY/3, 0]) {
                    cylinder(r=1, h=platformPadding, $fn=100);
                }

                translate([0, widthY/3*2, 0]) {
                    cylinder(r=1, h=platformPadding, $fn=100);
                }
            }
        }
      
    }

     
 
}

makeTray(platformX, platformY);

