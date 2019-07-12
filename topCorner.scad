
widthX = 20;

widthY = 20;

height = 10;

wallWidth = 3;

outerWidth = 5;

difference() {
    cube([widthX, widthY, height]);

    translate([outerWidth + 0.5, -1, height - wallWidth ]) {
        cube([widthX + 1, widthY - outerWidth + 0.5, wallWidth + 2]);
    }

       translate([widthX - 8, widthY - outerWidth - 0.5, 0 ]) {
        cube([8, 3.5, 20]);
    }

    // Join holes
    translate([3.5 , widthY - 3.5, 2]) {
        cylinder(r=1.25, h=11, $fn=100);
    }
}