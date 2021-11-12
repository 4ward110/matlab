function [ f, Pf ] = spectrocal( t, x )
%SPECTROCAL Summary of this function goes here
%   Detailed explanation goes here

Ns = length(x);
Ts = t(2) - t(1);

f = (-Ns/2:Ns/2-1)/(Ns*Ts);
Pf = fft(x, Ns);
Pf = fftshift(Pf)/Ns;
Pf = abs(Pf).^2;
end

