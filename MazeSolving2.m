fspeed = -50;
fspeed2 = -50;
bspeed = 30;
turnspeed = 110;
turnspeed2 = -90;
bcount = 0;
gcount = 0;

while 1
    disp("straight");
    brick.MoveMotor('B', fspeed);
    brick.MoveMotor('A', fspeed2);
    c = brick.ColorCode(4);
    d = brick.UltrasonicDist(2);
    t = brick.TouchPressed(1); % check the port right here
    if brick.TouchPressed(3)
        break;
    end
    if c == 5
        disp("red");
        brick.StopAllMotors();
        pause (4);
        brick.MoveMotor('AB', fspeed);
        pause(0.5);
    elseif c == 2 && bcount < 1
        disp("blue");
        brick.StopAllMotors();
        run ('KeyPressTest.m');
        bcount = bcount + 1;
        brick.MoveMotor('AB', fspeed);
        pause(4);
    elseif c== 3 && gcount < 1 && bcount >= 1
        disp("green")
        run('KeyPressTest.m');
        gcount = gcount + 1;
        brick.MoveMotor('AB',fspeed);
        pause(3);
    elseif (c == 4 && bcount >= 1 && gcount >= 1)
        disp("charging station")
        brick.StopAllMotors();
    end

    if d > 60
        disp("left turn");
        pause (0.5);
        brick.StopAllMotors();
        brick.MoveMotor('A', turnspeed2);
        brick.MoveMotor('B', turnspeed);
        pause(0.65);
        brick.StopAllMotors();
        disp("left straight");
        brick.MoveMotor('A', fspeed);
        brick.MoveMotor('B', fspeed2);
        pause(2); 
    end

    if t 
        disp("no straight");
        pause (0.2);
        brick.StopAllMotors();
        dist = brick.UltrasonicDist(2);
        brick.MoveMotor('AB', bspeed);
        pause(0.5);
        %preventative measure
        if dist < 50 %if there is no wall on the right
            disp("right");
            pause(0.3);
            brick.StopAllMotors();
            brick.MoveMotor('B',-40);
            brick.MoveMotor('A', 60);
            pause(1.1);
            brick.StopAllMotors();
            brick.MoveMotor('AB', fspeed); 
            pause(1);
        else %if there is a wall on the right
            brick.MoveMotor('A', 20);
            brick.MoveMotor('B', -40);
            pause(4.5);
            brick.StopAllMotors();
            brick.MoveMotor('AB', fspeed); 
            pause(2);
        end
    end
end
brick.StopAllMotors();