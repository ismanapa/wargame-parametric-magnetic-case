
widthX = 20;

widthY = 20;

height = 150;

wallWidth = 3;

difference() {

    cube([widthX, widthY, height]);

    translate([(widthX - wallWidth - 5), (widthY - wallWidth - 3.5), -1]) {
        cube([wallWidth + 6, wallWidth + 1.5, height + 2]);
    }

    translate([2, -1, -1]) {
        cube([wallWidth + 1.5, wallWidth + 6, height + 2]);
    }
    
    translate([wallWidth + 2.5, -1, -1]) {
        cube([(widthX - wallWidth - 1.5), (widthY - wallWidth - 1.5), height + 2]);
    }

    // Join holes
    translate([3.5 , widthY - 3.5, -1]) {
        cylinder(r=1.25, h=11, $fn=100);
        translate([0, 0, height - 8]){
            cylinder(r=1.25, h=11, $fn=100);
        }
    }

}



translate([(widthX + 20), 0, 0]) {

    localWidth = widthX - wallWidth - 2.5;

    difference() {
        cube([localWidth, (widthY - wallWidth - 2.5), height]);

        for (currentHeight=[7.5:7.5:height]) {
            if (currentHeight < height) {
                translate([0, 0, currentHeight]){
                    makeSupportJoin(localWidth);
                }
            }
        }
    }
}

module makeSupportJoin(width) {
    translate([width - 5, -1, 0]) {
        cube([7, 7, 2.5]);
    }
}
