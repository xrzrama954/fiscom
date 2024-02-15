mass = 2; % pendulum mass in kilograms
k = 50; % spring constant in N/m
npoints = 500; % Discretize time into 250 intervals
dt = 0.01; % time step in seconds
v = zeros(npoints,1); % initialize omega, a vector of dimension npoints X 1, to being all zeros
x = zeros(npoints,1); % initialize theta, a vector of dimension npoints X 1, to being all zeros
time = zeros(npoints,1); % initialize the vector time to being all zeros
q = 1.5; % damping factor

v(1) = 0.0;
x(1) = 0.5; % initial displacement
for step = 1:npoints-1 % loop over the timesteps
    v(step+1) = v(step) + (-q * v(step) - (k/mass) * x(step)) * dt;
    x(step+1) = x(step) + v(step+1) * dt;
    time(step+1) = time(step) + dt;
end

plot(time, x, 'r'); % plots the numerical solution in red
xlabel('time (seconds)');
ylabel('theta (radians)');
