% Define parameters
x0 = 1.0; % initial position
v0 = 0.0; % initial velocity
k = 1.0; % spring constant
m = 1.0; % mass
t = linspace (0, 100, 1000); % time vector

% Define the equation of motion as an anonymous function
f = @(t,x) [x(2); -k/m*x(1)];

% Solve the equation using ode45
[t,x] = ode45 (f, t, [x0 v0]);

% Plot the position as a function of time
plot (t,x(:,1))
xlabel ('Time')
ylabel ('Position')
title ('Simple Harmonic Oscillator')

