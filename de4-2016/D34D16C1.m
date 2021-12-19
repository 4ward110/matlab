%%ve tin hieu trong mien thoi gian 5 chu ki
%D16 - D3 - C1
clc;
clear all;

Np=5; %So xung can ve
T=10; % Chu ky tin hieu
t=0:1/T:Np*T; % Vecto thoi gian tu 0->50s
dem=T;
for i=1:length(t)
    y(i)=1;
    if(t(i)>(dem-T/2))
        y(i)=0;
    end
    if (t(i)>=(dem))
        dem=dem+T;
    end
end
figure(1)
plot(t,y); grid on;

%b) Bien doi Fourier
Ns=length(y);
Ts=t(2)-t(1);
f=(-Ns/2:Ns/2-1)/(Ns*Ts); %Tao vecto tan so
Yf=fft(y,length(y)); % Bien doi F
Yf=fftshift(Yf)/Ns; % Dich pho tan ve goc

% C) Ve
Yfabs=abs(Yf); % Tinh pho bien do
Yfphase=angle(Yf); % Tinh pho pha
figure(2)
subplot(211);
plot(f,Yfabs); grid on;
subplot(212);
plot(f,Yfphase); grid on;
