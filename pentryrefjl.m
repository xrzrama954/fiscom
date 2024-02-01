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
tspan = [0.0, 50.0];

% Solusi numerik
k = 1.0;
m = 1.0;
gamma = 0.1;
options = odeset('MaxStep', dt);
[t, sol] = ode45(@(t, u) damped_harmonic_motion(t, u), tspan, u0, options);

% Buat animasi
figure;

% Ubah ini sesuai dengan nama file yang diinginkan
filename = 'gerak_harmonik_teredam.gif';

% Kurangi jumlah frame untuk mengurangi waktu animasi
frames_per_second = 90; % Ubah sesuai kebutuhan
num_frames = round(frames_per_second * 30); % Animasi 1 menit
frame_step = round(length(t) / num_frames);

for i = 1:frame_step:length(t)
    plot(t(1:i), sol(1:i, 1), 'LineWidth', 2);
    xlabel('Waktu');
    ylabel('Posisi');
    title('Gerak Harmonik Teredam');
    legend('Posisi');
    drawnow;

    % Simpan frame sebagai file GIF
    frame = getframe(gcf);
    im = frame2im(frame);

    if i == 1
        imwrite(im, filename, 'gif', 'LoopCount', Inf, 'DelayTime', 1/frames_per_second);
    else
        imwrite(im, filename, 'gif', 'WriteMode', 'append', 'DelayTime', 1/frames_per_second);
    end
end
