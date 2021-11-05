clc;
clear all;

dm = randint(1,20,4);
s = pammod(dm,4);
r = pamdemod(s,4);

figure(1)
subplot(1,3,1)
stem(dm)
subplot(1,3,2)
stem(s)
subplot(1,3,3)
stem(r)


% h = [0 1 0 1];
% [t,y,code] = nrzcode(h,1e6,512);
% 
% 
% ts = t(2) - t(1);
% fs = 1/ts;
% fc = 10e6;
% yd = ammod(y,fc,fs);