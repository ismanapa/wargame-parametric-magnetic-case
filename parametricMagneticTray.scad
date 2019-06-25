
//Platform X
platformX = 180;

//Platform Y
platformY = 180;

//Base Diameter
baseDiamater = 32;

//Base separation X
baseSeparationX = 5;

//Base separation Y
baseSeparationY = 5;

//Platform margin
platformPadding = 10;

//X Axis calculations
baseNumberX = floor((platformX - platformPadding*2 + baseSeparationX) / (baseDiamater + baseSeparationX));
availableSpaceX = ((platformX - platformPadding*2) - (baseNumberX * baseDiamater));
finalSeparationX = availableSpaceX > 0 ? availableSpaceX / (baseNumberX - 1) : 0;

echo("<h1>SPACE BETWEEN BASES X", finalSeparationX, "</h1>");

//Y Axis calculations
baseNumberY = floor((platformY - platformPadding*2 + baseSeparationY) / (baseDiamater + baseSeparationY));
availableSpaceY = ((platformY - platformPadding*2) - (baseNumberY * baseDiamater));
finalSeparationY = availableSpaceY > 0 ? availableSpaceY / (baseNumberY - 1) : 0;

echo("<h1>SPACE BETWEEN BASES Y", finalSeparationY, "</h1>");

difference() 
{
    cube([platformX, platformY, 4]);
    
    for (ix = [0:baseNumberX-1])
        for(iy = [0:baseNumberY-1])
            translate([ 
                ((platformPadding + baseDiamater/2) + (ix * (baseDiamater + finalSeparationX)) ), 
                ((platformPadding + baseDiamater/2) + (iy * (baseDiamater + finalSeparationY)) ),
                2
            ])
            cylinder(r=baseDiamater/2, h=8,$fn=100);
}
