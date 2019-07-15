long = 126;

height = 2;

width = 12;

union() {
    cube([long, width, height]);

    cube([long, height, width]);
}
