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
    % color detection
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
        pause(2);
    elseif c== 3 && gcount < 1 && bcount >= 1
        disp("green")
        run('KeyPressTest.m');
        gcount = gcount + 1;
        brick.MoveMotor('AB',fspeed);
        pause(2);
    elseif (c == 4 && gcount >= 1)
        disp("charging station")
        brick.StopAllMotors();
        pause(2);
        break;
    end
    
    %left turning
    if d > 60
        disp("right turn");
        pause (0.8);
        brick.StopAllMotors();
        pause(0.3);
        brick.MoveMotor('A', 40);
        brick.MoveMotor('B', -60);
        pause(1.1);
        brick.StopAllMotors();
        disp("right straight");
        brick.MoveMotor('A', fspeed);
        brick.MoveMotor('B', fspeed2);
        pause(0.5);
        color = brick.ColorCode(4);
        if color == 5
            brick.StopAllMotors();
            pause (4);
        end
        brick.MoveMotor('A', fspeed);
        brick.MoveMotor('B', fspeed2);
        pause(2); 
    end

    %turning right/ turning around
    if t 
        disp("no straight");
        pause (0.6);
        brick.StopAllMotors();
        dist = brick.UltrasonicDist(2);
        brick.MoveMotor('AB', bspeed);
        pause(0.1);
        %preventative measure
        if dist < 50 %if there is no wall on the right
            disp("left");
            brick.StopAllMotors();
            pause(0.3);
            %brick.MoveMotor('B',10);
            %brick.MoveMotor('A', 90);
            %pause(0.1);
            brick.MoveMotor('B',80);
            brick.MoveMotor('A',0);
            pause(1.06);
            brick.StopAllMotors()
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