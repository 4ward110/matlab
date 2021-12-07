function [ f, Pf ] = spectrocal( t, x )
%SPECTROCAL Summary of this function goes here
%   Detailed explanation goes here

Ns = length(x);
Ts = t(2) - t(1);

f = (-Ns/2:Ns/2-1)/(Ns*Ts); %tính vector t?n s?
Pf = fft(x, Ns); %khai tri?n fourier
Pf = fftshift(Pf)/Ns; %d?ch thành ph?n t?n s? 0 v? trung tâm ph?
Pf = abs(Pf).^2; %mat do ph? n?ng l??ng 
end

