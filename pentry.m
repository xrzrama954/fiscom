% Parameter
m = 2;      % kg
b = 1.5;    % N/m^3
k = 50;     % N/m
x0 = 0.5;   % m
v0_a = 0.0; % m/s
v0_b = 0.5; % m/s
dt = 0.01;  % time step
total_time = 8; % total simulation time

% Inisialisasi variabel
num_steps = round(total_time / dt) + 1;
time = linspace(0, total_time, num_steps);
x_a = zeros(1, num_steps);
v_a = zeros(1, num_steps);
x_b = zeros(1, num_steps);
v_b = zeros(1, num_steps);

% Syarat awal a)
x_a(1) = x0;
v_a(1) = v0_a;

% Syarat awal b)
x_b(1) = x0;
v_b(1) = v0_b;

% Metode Euler-Cromer
for i = 2:num_steps
    v_a(i) = v_a(i - 1) + (dt / m) * (-b * v_a(i - 1) - k * x_a(i - 1));
    x_a(i) = x_a(i - 1) + dt * v_a(i);

    v_b(i) = v_b(i - 1) + (dt / m) * (-b * v_b(i - 1) - k * x_b(i - 1));
    x_b(i) = x_b(i - 1) + dt * v_b(i);
end

% Plot hasil simulasi
figure;
subplot(2, 1, 1);
plot(time, x_a, 'b', 'LineWidth', 2, 'DisplayName', 'dx/dt = 0.0 m/s');
hold on;
plot(time, x_b, 'r', 'LineWidth', 2, 'DisplayName', 'dx/dt = 0.5 m/s');
title('Simulasi Sistem Massa Pegas Teredam');
xlabel('Waktu (s)');
ylabel('Simpangan (m)');
legend('show');
grid on;

subplot(2, 1, 2);
plot(time, v_a, 'b', 'LineWidth', 2, 'DisplayName', 'dx/dt = 0.0 m/s');
hold on;
plot(time, v_b, 'r', 'LineWidth', 2, 'DisplayName', 'dx/dt = 0.5 m/s');
title('Simulasi Sistem Massa Pegas Teredam');
xlabel('Waktu (s)');
ylabel('Kecepatan (m/s)');
legend('show');
grid on;

