% Parameter
k = 1;  % Konstanta pegas
m = 1;  % Massa

% Kondisi awal
x0 = 1; % Posisi awal
v0 = 0; % Kecepatan awal

% Waktu
t0 = 0;
tf = 200;
h = 0.005;   % Step size

% Jumlah langkah waktu
n_steps = round((tf - t0) / h);

% Inisialisasi
t = zeros(1, n_steps+1);
x = zeros(1, n_steps+1);
v = zeros(1, n_steps+1);

% Kondisi awal
t(1) = t0;
x(1) = x0;
v(1) = v0;

% Metode Euler-Kutta (RK4)
for i = 1:n_steps
    % K1
    dxdt_k1 = v(i);
    dvdt_k1 = -k/m * x(i);

    % K2
    dxdt_k2 = v(i) + h/2 * dvdt_k1;
    dvdt_k2 = -k/m * (x(i) + h/2 * dxdt_k1);

    % K3
    dxdt_k3 = v(i) + h/2 * dvdt_k2;
    dvdt_k3 = -k/m * (x(i) + h/2 * dxdt_k2);

    % K4
    dxdt_k4 = v(i) + h * dvdt_k3;
    dvdt_k4 = -k/m * (x(i) + h * dxdt_k3);

    % Update posisi dan kecepatan menggunakan hasil RK4
    x(i+1) = x(i) + h/6 * (dxdt_k1 + 2*dxdt_k2 + 2*dxdt_k3 + dxdt_k4);
    v(i+1) = v(i) + h/6 * (dvdt_k1 + 2*dvdt_k2 + 2*dvdt_k3 + dvdt_k4);

    % Update waktu
    t(i+1) = t(i) + h;
end

% Plot hasil
figure;
subplot(2, 1, 1);
plot(t, x, 'linewidth', 2);
title('Posisi terhadap Waktu');
xlabel('Waktu (s)');
ylabel('Posisi (m)');

subplot(2, 1, 2);
plot(t, v, 'linewidth', 2);
title('Kecepatan terhadap Waktu');
xlabel('Waktu (s)');
ylabel('Kecepatan (m/s)');

