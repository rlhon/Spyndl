fspeed = -70;
bspeed = 30;
turnSpeed = 40;
turnSpeed2 = -20;
bgcount = 0;

while 1
    brick.MoveMotor('AB', fspeed);
    c = brick.ColorCode(4);
    d = brick.UltrasonicDist(2);
    t = brick.TouchPressed(1); % check the port right here
    if c == 5
        disp("red");
        brick.StopAllMotors();
        pause (4);
        brick.MoveMotor('AB', fspeed);
        pause(0.5);
    elseif c == 3 || c== 2
        disp("blue");
        run ('KeyPressTest')
        brick.MoveMotor('AB', fspeed);
        pause(4);
    end
   % elseif c == 2
   %     disp("green");
   %     brick.MoveMotor('D',30);
   %     pause(2);
   %     brick.MoveMotor('AB', -fspeed);
   %     pause(1);
   %     brick.MoveMotor('D',-30)
   %     pause(2);
        % do we need to turn here or smthg
   % end }

    if d > 70
        disp("left turn");
        pause (0.5);
        brick.StopAllMotors();
        brick.MoveMotor('A',turnSpeed);
        pause(1);
        brick.StopMotor('A');
        brick.MoveMotor('AB', fspeed);
        pause(1);
    end

    if t
        disp("no straight");
        pause (0.5);
        brick.StopAllMotors();
        dist = brick.UltrasonicDist(1);
        brick.MoveMotor('AB', bspeed);
        pause(0.3);
        if dist < 50 %if there is no wall on the right
            brick.MoveMotor('B', -18.5); 
            pause(2.5);
            brick.StopMotor('B', 'Brake');
            brick.MoveMotor('AB', fspeed); 
            pause(1);
        else %if there is a wall on the right
            brick.MoveMotor('A', -21);
            pause(2.5);
            brick.StopMotor('A', 'Brake');
            brick.MoveMotor('AB', fspeed); 
            pause(1);
        end
    end
end