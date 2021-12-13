N = 4;
T = 1;
Ts = 1/100;
t = 0;
time = [0:0.01:4];
pulse = zeros(1,4/0.01);
k = 1;
for i = 1:N
    while(t <= i)
        if(t <= i - 1/2)
            pulse(k) = 1;
            k = k + 1;
            t = t + Ts;
        else
            pulse(k) = 0;
            k = k + 1;
            t = t + Ts;
        end
    end
end
% plot(time,pulse)

f = [0:0.25:100];
yf = fft(pulse,length(pulse));
yf2 = fftshift(yf);
plot(f,yf2)
% plot(f,yf2)