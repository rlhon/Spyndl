brick.SetColorMode(4, 2);
color = brick.ColorCode(4);
greencount = 0;
yellowcount = 0;
if color == 4
    yellowcount = yellowcount + 1;
end
if yellowcount >= 0 && greencount ==0
 %maze solving algorithm goes here
end