%f1 = 10, f2 = 15

%Hinh 1 ftheo nyqyst = 2*fmax => Tnyquist = 1/fnyquist

%Hinh 2 fMatLab = 16*fnyquist => TMatlab = 1/fMatlab 

%plot in 1 figure

%t = 0:T:Tm (Tm t? 2 -> 5 chu kì) khoang 0.5s

clear all;
clc;
fc = 300;
fmax = 2*15;
fnyquist = 2*fmax;
fml = 16*fnyquist;
A = 2

% t = [0:1/fmax:1];
% 
% s=2.*cos(20*pi*t+pi/4)+cos(30*pi*t);

% figure
% subplot(2,2,1);
% plot(t,s)
% title('lay mau nyquist');

t2 = [0:1/fml:1];
s2 = 2.*cos(20*pi*t2+pi/4)+cos(30*pi*t2);
subplot(2,1,1);
plot(t2,s2)
title('Tin hieu lay mau theo matlab');

y = ammod(s2,fc,fml,A);
subplot(2,1,2)
plot(t2,y)
title('Tin hieu dieu che AM');







