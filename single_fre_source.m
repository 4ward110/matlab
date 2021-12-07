% Ch??ng trình ví d? t?o tín hi?u ?a t?n và v? ph?
% Thi?t l?p các tham s?
A1 = 3; % amplitude
f1 = 500; % frequency [Hz]
phi1 = -pi/4; % Phase [rad]
A2 = 2; % amplitude
f2 = 300; % frequency [Hz]
phi2 = 0; % Phase [rad]
N = 2^6; % number of samples
T0 = 0; % start time [s]
Tf = 10e-3; % end time [s]
Ts = (Tf-T0)/(N-1); % Tính chu k? m?u
fs = 1/Ts; % T?n s? l?y m?u [Hz]
% T?o tín hi?u ?a t?n
t = T0:Ts:Tf;
x = A1*cos(2*pi*f1*t+phi1)+A2*cos(2*pi*f2*t+phi2);
% Bi?u di?n k?t qu?
figure(1);
plot(t*1e3,x,'o-');
xlabel('Time (ms)');
ylabel('Amplitude');
title('Vi du ve tao tin hieu hinh sin');
% ??c tính ph?
figure(2);
[f,Xf] = spectrocal(t,x);
semilogy(f,Xf);
xlabel('Frequency (Hz)');
ylabel('PSD');
title('Pho tin hieu da tan');
grid;
axis([0 2000, 3 1e-4]);