global key
InitKeyboard();

while 1
    pause(0.1);
    switch key
        case 'uparrow'
            brick.MoveMotor('A',100);
            brick.MoveMotor('D',100);
        case 'downarrow'
            brick.MoveMotor('A',-100);
            brick.MoveMotor('D',-100);
        case 'rightarrow'
            brick.MoveMotor('A',50);
            brick.MoveMotor('D',-30);
        case 'leftarrow'
            brick.MoveMotor('D',50);
            brick.MoveMotor('A',-30);
        case 0
            brick.StopAllMotors;
        case 'q'
            break;
    end
end
CloseKeyboard();
