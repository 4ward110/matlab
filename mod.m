% Signal generator
dm = randint(1,1000,4);
% PAM modulation
s = pammod(dm,4);
% PAM demodulation
r = pamdemod(s,4);
% Data sequence
% h = [0 1 0 1];
% % NRZ modulation
% [t,y]=nrzcode(h,1e6,512);
% % AM demodulation
% ts = t(2)-t(1); % sampling time
% fs = 1/ts; % sampling freq.
% fc = 10e6; % carrier freq.
% yd = ammod(y,fc,fs);
% plot(t,yd)
