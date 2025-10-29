function [z] = PSO_Objective(x)
% 
% % Load the Simulink model and set the PID gains
load_system('Notch');
assignin('base','R1',x(1)); 
assignin('base','R2',x(2));
assignin('base','R3',x(3));
assignin('base','R4',x(4));
assignin('base','R5',x(5));

assignin('base','C1',x(6));
assignin('base','C2',x(7));
assignin('base','C3',x(8));

out = sim('Notch',[0,0.01]);     
%disp(x(end-2:end))
q = out.simout.data(1,:);
L = length(q);

if length(out.tout) < 10001
z= 10e6;
else

Y = fft(q);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
z = (sum(P1(813-20:813+20))/sum(P1(271-20:271+20)))^-1;

end