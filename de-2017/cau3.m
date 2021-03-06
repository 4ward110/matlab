fc = 500;
fs = 20*fc;
t = 0:1/fs:2;
SNR = 20;
fx = sin(30*pi*t) - 3*cos(10*pi*t);
data_mod = ammod(fx,fc,fs);
figure;
plot(t,data_mod);
awgn_data = awgn(data_mod,SNR);
figure;
plot(t,awgn_data);
