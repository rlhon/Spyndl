global key
InitKeyboard();

while 1
    pause(0.1);
    switch key
        case 'uparrow'
            brick.MoveMotor('A',50);
            brick.MoveMotor('D',50);
        case 'downarrow'
            brick.MoveMotor('A',-50);
            brick.MoveMotor('D',-50);
        case 'leftarrow'
            disp('Left Arrow Pressed!');
        case 'rightarrow'
            disp('Right Arrow Pressed');
        case 0
            brick.StopAllMotors;
        case 'q'
            break;
    end
end
CloseKeyboard();