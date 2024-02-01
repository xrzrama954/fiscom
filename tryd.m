% Parameters
dt = 0.01;  % Time step
T = 100.0;   % Total simulation time
x0 = 1.0;   % Initial displacement
v0 = 0.0;   % Initial velocity
k = 1.0;    % Spring constant
m = 1.0;    % Mass

% Number of time steps
num_steps = round(T / dt);

% Initialize arrays to store results
time_values = zeros(num_steps + 1, 1);
x_values = zeros(num_steps + 1, 1);
v_values = zeros(num_steps + 1, 1);

% Initial conditions
x_values(1) = x0;
v_values(1) = v0;

% Euler method loop
for i = 1:num_steps
    time_values(i + 1) = time_values(i) + dt;
    x_values(i + 1) = x_values(i) + v_values(i) * dt;
    v_values(i + 1) = v_values(i) - (k / m) * x_values(i) * dt;
end

% Plot the results
figure;
subplot(2, 1, 1);
plot(time_values, x_values, 'LineWidth', 1.5);
xlabel('Time');
ylabel('Displacement');
title('Harmonic Oscillator Simulation (Euler Method)');

subplot(2, 1, 2);
plot(time_values, v_values, 'LineWidth', 1.5);
xlabel('Time');
ylabel('Velocity');
title('Velocity');

% Display the plot
sgtitle('Harmonic Oscillator Simulation');

