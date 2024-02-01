% Parameter
k = 1;  % Konstanta pegas
m = 1;  % Massa

% Kondisi awal
x0 = 1; % Posisi awal
v0 = 0; % Kecepatan awal

% Waktu
t0 = 0;
tf = 50;
h = 0.0075;   % Step size

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

% Metode Euler
for i = 1:n_steps
    dxdt = v(i);
    dvdt = -k/m * x(i);

    x(i+1) = x(i) + h * dxdt;
    v(i+1) = v(i) + h * dvdt;
    t(i+1) = t(i) + h;
end

% Plot hasil
figure;
subplot(2, 1, 1);
plot(t, x, 'linewidth', 3);
title('Posisi terhadap Waktu');
xlabel('Waktu (s)');
ylabel('Posisi (m)');

subplot(2, 1, 2);
plot(t, v, 'linewidth', 3);
title('Kecepatan terhadap Waktu');
xlabel('Waktu (s)');
ylabel('Kecepatan (m/s)')
