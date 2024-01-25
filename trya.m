a = 2 + 3;
b = a * a;
c = a * a * a;
d = sqrt(a);

fprintf('%4u square equals %4u \r', a, b);
pause(1); % Menunggu selama 1 detik (opsional)
fprintf('%4u cube equals %4u \r', a, c);
pause(1); % Menunggu selama 1 detik (opsional)
fprintf('The square root of %2u is %6.4f \r', a, d);

