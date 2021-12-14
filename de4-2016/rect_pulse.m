% Np = 4;
% fs = 1e2;
% t = 0:1/fs:Np;
% size(t)
% count = 1;
% for i=1:length(t)
%     y(i)=1;
%     if(t(i) >= (count-1/2))
%         y(i)=0;
%     end
%     if(t(i) >= count)
%         count = count + 1;
%     end
% end
% size(y)
% plot(t,y);
% clc
% clear all
% R = 1e3;
% Tp = 1/R;
% fs = 16*R;
% ts = 1/fs;
% 
% t = 0:ts:5*Tp;
% 
% for i = 1:length(t)
%     tm = mod(t(i),Tp);
%     y(i) = exp(-4*tm/Tp);
% end
% plot (t,y)
% grid 

Ts = 0.01; 
N=2000; 
t=-20:Ts:(20)*Ts;
T = 1;
fs=1/Ts;
f=0:fs/N:(N-1)/N*fs;
x1 = rectpuls(t, T);
xk=fft(x1);
figure(1); plot(t,x1)
figure(3); plot(f, 1/N*abs(xk(1:length(f))));