
widthX = 15;

widthY = 15;

height = 10;

wallWidth = 3;

difference() {
    cube([widthX, widthY, height]);

    translate([5, -1, height - wallWidth - 1 ]) {
        cube([widthX + 1, widthY - 4, wallWidth + 2]);
    }
}