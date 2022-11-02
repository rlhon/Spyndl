color = brick.ColorCode(4);
d = brick.UltrasonicDist(1);
greencount = 0;
yellowcount = 0;
bluecount = 0;
pickedup = 0;
droppedoff = 0;
global key;
if color == 4
    if bluecount == 0 && greencount == 0
        yellowcount = yellowcount + 1;
    end
end
disp(yellowcount);
while yellowcount < 2 && color ~= 2 && color ~= 3 % hasn't picked up person & reached charging point
    %navigation code goes here
    brick.MoveMotor('AB',-10);
    color = brick.ColorCode(4);
    if color == 5
        brick.StopAllMotors();
        pause (4);
        brick.MoveMotor('AB',-10)
        pause(5);
    end
    brick.MoveMotor('AB',-10);
    color = brick.ColorCode(4);
end
brick.StopAllMotors();

while color == 3 && pickedup == 0
    InitKeyboard();
    while 1
        pause(0.1);
        switch key
            case 'downarrow' % down arrow moves it backwards
                brick.MoveMotor('A',90);
                brick.MoveMotor('B',90);
            case 'uparrow' % up arrow moves it foqrward
                brick.MoveMotor('A',-90);
                brick.MoveMotor('B',-90);
            case 'rightarrow' % right arrow turns it right
                brick.MoveMotor('A',40);
                brick.MoveMotor('B',-20);
            case 'leftarrow' % left arrow turns it left
                brick.MoveMotor('B',40);
                brick.MoveMotor('A',-20);
            case 'w' %opens the claw
                brick.MoveMotor('D',30);
            case 's'%closes the claw
                brick.MoveMotor('D',-30);
            case 0 % stops motors when no keys are pressed
                brick.StopAllMotors;
            case 'q' %q breaks the entire program
                pickedup = 1;
                break
            
        end
    end
    CloseKeyboard();
    if greencount == 0 && pickedup == 1
        greencount = 1;
        disp(greencount);
    end

end

while color ~= 2
    brick.MoveMotor('AB',-10);
    color = brick.ColorCode(4);
end

while color == 2 && pickedup == 1 && greencount ==1 && droppedoff == 0
    disp(greencount);
    brick.StopAllMotors();
    brick.MoveMotor('D',30);
    pause(2);
    brick.MoveMotor('D',-30)
    pause(2);
    brick.MoveMotor('AB',-10);
    pause(5);
    droppedoff = 1;
end

