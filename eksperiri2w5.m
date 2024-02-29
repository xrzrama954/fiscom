% Solution of wave equation for string
%
clear;
string_dimension=100;
% Preallocate matrices for speed;
x=1/string_dimension:1/string_dimension:1;
x_scale=1:1:string_dimension;
y_next =zeros(1,string_dimension);
% Initialise string position
k=1000;
x_0=0.3;
initial_position=exp(-k.*(x-x_0).^2);
y_current =initial_position;
y_previous = initial_position;
for time_step = 1:500;
[y_next]=propagate(y_current, y_previous);
y_previous=y_current;
y_current=y_next;
% pause(0.1);
clf;
plot(x_scale/string_dimension, y_current,'r');
title('Waves on a string - fixed ends');
xlabel('distance');
ylabel('Displacement');
axis([0 1 -1 1]);
hold on;
drawnow;
end;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
