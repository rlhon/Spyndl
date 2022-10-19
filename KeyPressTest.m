global key
InitKeyboard();

while 1
    pause(0.1);
    switch key
        case 'downarrow'
            brick.MoveMotor('A',90);
            brick.MoveMotor('B',90);
        case 'uparrow'
            brick.MoveMotor('A',-90);
            brick.MoveMotor('B',-90);
        case 'rightarrow'
            brick.MoveMotor('A',40);
            brick.MoveMotor('B',-20);
        case 'leftarrow'
            brick.MoveMotor('B',40);
            brick.MoveMotor('A',-20);
        case 'w'
            brick.MoveMotor('D',30);
        case 's'
            brick.MoveMotor('D',-30);
        case 0
            brick.StopAllMotors;
        case 'q'
            break;
    end
end
CloseKeyboard();