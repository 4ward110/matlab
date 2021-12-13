M = 4;
N = 2000;
data = randi([0 M-1],1,N);
No = 8;
Es = 1e-5;
phase = 0;
Rs = 1e6;
fs = 20*Rs;
Ts = 1/Rs;
c = 1;
% hist(data,M)
%dieu che
mod_data = pskmod(data,M);
% mod_data(1:100)
% size(mod_data)
t = 0:1/fs:length(mod_data)*Ts;
size(t)
%dang song tin hieu phat
for i=1:length(t)
    Tx(i) = mod_data(c)*sqrt(2*Es/Ts)*exp(j*phase);
    if(t(i) >= c/Rs)
        c = c+1;
    end
end
c
% Tx(1:100)
% add Gauss noise
noise = sqrt(No/2)*(randn(1,length(Tx)) + j*randn(1,length(Tx)));
d = 1;
Rx = Tx + noise;
size(Rx)
for i=1:length(t)
    if abs(t(i) - (d-1/2)*Ts) <= 1/(2*fs)
        demod_data(d) = Rx(i)/(sqrt(2*Es/Ts)*exp(j*phase));
        d = d + 1;
    end
end
d
size(demod_data)
demod = pskdemod(demod_data,M);
plot(t(1:1000),Tx(1:1000));
figure
plot(t(1:1000), Rx(1:1000));

