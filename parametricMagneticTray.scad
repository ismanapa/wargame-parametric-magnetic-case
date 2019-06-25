//Printing Area X
printAreaX = 150;

//Printing Area Y
printAreaY = 150;

//Platform X
platformX = 300;

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

module makeTray(widthX, widthY, hasLeftUnion = false, hasRightUnion = false) {

    //X Axis calculations
    baseNumberX = floor((widthX - platformPadding*2 + baseSeparationX) / (baseDiamater + baseSeparationX));
    availableSpaceX = ((widthX - platformPadding*2) - (baseNumberX * baseDiamater));
    finalSeparationX = availableSpaceX > 0 ? availableSpaceX / (baseNumberX - 1) : 0;

    echo("<h1>SPACE BETWEEN BASES X", finalSeparationX, "</h1>");

    //Y Axis calculations
    baseNumberY = floor((widthY - platformPadding*2 + baseSeparationY) / (baseDiamater + baseSeparationY));
    availableSpaceY = ((widthY - platformPadding*2) - (baseNumberY * baseDiamater));
    finalSeparationY = availableSpaceY > 0 ? availableSpaceY / (baseNumberY - 1) : 0;

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

    union() {
        difference() {
            cube([widthX, widthY, 4]);
            
            if (baseNumberY > 0 && baseNumberX > 0) {
                for (ix = [0:baseNumberX-1])
                    for(iy = [0:baseNumberY-1])
                        makeBase(ix, iy);
            }

            if (hasRightUnion) {
                //Right union
                translate([widthX - 10, widthY / 3 - 5, -1]) {
                    cube([11, 10, 3]);
                }
                
                translate([widthX - 10, widthY / 3 * 2 - 5, -1]) {
                    cube([11, 10, 3]);
                }
            }
        }

        if (hasLeftUnion) {
            //Left union
            translate([-10, widthY / 3 - 5, -1]) {
                cube([10, 10, 3]);
            }
            
            translate([-10, widthY / 3 * 2 - 5, -1]) {
                cube([10, 10, 3]);
            }
        }   
    }
}

//TODO: make this adaptable to input parameters
makeTray(150, 150, false, true);

translate([180, 0, 0]) {
    makeTray(150, 150, true, false);
}
