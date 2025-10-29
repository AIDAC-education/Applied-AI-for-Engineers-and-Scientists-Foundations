function [z] = PSO_PID(x)
% 
% % Load the Simulink model and set the PID gains
load_system('Lift_PID');  
assignin('base','Kp',x(1)); % Control parameter 1
assignin('base','Ki',x(2)); % Control parameter 2
assignin('base','Kd',x(3)); % Control parameter 3

out = sim('Lift_PID',[0,20]);     % simulate the controller and the response is saved in info
info=stepinfo(simout.data);
disp(x)

z = 0.001*(info.RiseTime)+0.0006*(info.SettlingTime)+info.Overshoot+20*(abs(2-simout.Data(end))); % objective function to be minimized
%Weight coefficients in front of parameters are empyrical 
%the desired steady state is 2


end