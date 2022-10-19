global key
InitKeyboard();

while 1
    pause(0.1);
    switch key
        case 'downarrow' % down arrow moves it backwards
            brick.MoveMotor('A',90);
            brick.MoveMotor('B',90);
        case 'uparrow' % up arrow moves it forward
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
            break;
    end
end
CloseKeyboard();