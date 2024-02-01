% Define parameters
x0 = 1.0; % initial position
v0 = 0.0; % initial velocity
k = 1.0;  % spring constant
m = 1.0;  % mass
t_end = 100;  % end time
h = 0.1;  % time step

% Initialize vectors
t = 0:h:t_end;
n_steps = length(t);
x = zeros(1, n_steps);
v = zeros(1, n_steps);

% Set initial conditions
x(1) = x0;
v(1) = v0;

% Numerical integration using Euler's method
for i = 1:n_steps - 1
    dvdt = -k/m * x(i);
    dxdt = v(i);

    v(i + 1) = v(i) + h * dvdt;
    x(i + 1) = x(i) + h * dxdt;

    % Optional: Implementing a more accurate time step adaptation
    % h = min(0.1, 0.2 / abs(dvdt)); % Example of adaptive time step
    % t(i + 1) = t(i) + h;
end

% Plot the position as a function of time
plot(t, x)
xlabel('Time')
ylabel('Position')
title('Simple Harmonic Oscillator - Euler Method')

