d = randint(1,100); % Message data
% NRZ coding
[t,x] = nrzcode(d,1e6,2000,'pol');
Ts = t(2)-t(1); % sampling time
% pulse shaping
xp = raisecosflt(x,1.5e6,Ts,0.5);
% Transmit through AWGN channel
SNRdB = 10; % dB
SNR = 10^(SNRdB/10);
varn = var(xp)/SNR; % computing
% variance of noise
xnoise = addnoise(xp,varn);
% Display
plot(t,xp,'rx',t,xnoise);grid;
xlabel('Time (s)');
ylabel('Amplitude');
eyediagram(xp,40);
eyediagram(xnoise,40);