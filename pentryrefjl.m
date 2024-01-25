peringatan jangan dijalankan kodenya untuk saat ini
%pkg load video  % Load the video package for avi function

% Parameter simulasi
m = 1.0;
k = 1.0;
gamma = 0.1;
dt = 0.01;
omega_0 = sqrt(k/m);

% Persamaan diferensial gerak harmonik teredam
function du = damped_harmonic_motion(t, u)
    global k m gamma
    du = zeros(2, 1);
    du(1) = u(2);
    du(2) = -k/m * u(1) - gamma/m * u(2);
end

% Kondisi awal
u0 = [1.0; 0.0];

% Waktu
tspan = [0.0, 100.0];

% Solusi numerik
global k m gamma
k = 1.0;
m = 1.0;
gamma = 0.1;
options = odeset('MaxStep', dt);
[t, sol] = ode45(@(t, u) damped_harmonic_motion(t, u), tspan, u0, options);

% Buat animasi
figure;
v = VideoWriter('gerak_harmonik_teredam.avi');
open(v);
for i = 1:length(t)
    plot(t(1:i), sol(1:i, 1), 'LineWidth', 2);
    xlabel('Waktu');
    ylabel('Posisi');
    title('Gerak Harmonik Teredam');
    legend('Posisi');
    drawnow;
    frame = getframe(gcf);
    writeVideo(v, frame);
end
close(v);

