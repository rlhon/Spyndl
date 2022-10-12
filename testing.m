display('Push the button.')
while brick.TouchPressed(1) == 0
 brick.MoveMotor('A',50);
 brick.MoveMotor('D',50);
end
brick.StopAllMotors;
display('Done!') 
