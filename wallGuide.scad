
widthX = 15;

widthY = 15;

height = 150;

wallWidth = 3;



difference() {

    cube([widthX, widthY, height]);

    translate([(widthX - wallWidth - 5), (widthY - wallWidth - 2), -1]) {
        cube([wallWidth + 6, wallWidth, height + 2]);
    }

    translate([2, -1, -1]) {
        cube([wallWidth, wallWidth + 6, height + 2]);
    }

    for (currentHeight=[7.5:7.5:height]) {
        if (currentHeight < height) {
            translate([0, 0, currentHeight]){
                makeSupportJoin();
            }
        }
    }

}

module makeSupportJoin() {
    translate([widthX - 5, -1, 0]) {
        cube([7, 7, 2.5]);
    }
}
