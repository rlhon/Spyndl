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

if yellowcount < 2 % hasn't picked up person & reached charging point
    while d <= 30
        while brick.TouchPressed(1) == 0 %when there is no wall in front
            while color ~= 4 && color ~= 2 && color ~= 3
                brick.MoveMotor('AB',-100);
                color = brick.ColorCode(4);
                if color == 5 %when red
                    brick.StopAllMotors();
                    pause(4);
                end
                brick.MoveMotor('AB', -100);
                color = brick.ColorCode(4);
            end
            while color == 3 && greencount == 0 && pickedup == 0
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
                            break;
                    
                    end
                end
                CloseKeyboard();
                if greencount == 0 && pickedup == 1
                    greencount = 1;
                end
            end
            while color == 2 && pickedup == 1 && droppedoff == 0
                brick.MoveMotor('D',30);
                pause(5);
                brick.MoveMotor('AB',90)
                pause(2);
                brick.MoveMotor('D',-30);
                pause(5);
                droppedoff = 1;
            end
        end
    end
end
