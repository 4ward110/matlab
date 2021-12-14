T = 5;
fs = 100;
ts = 1/fs;
t = -10:1/100:10;
y = zeros(length(t));
for k=1:T
    for i=1:length(t)
        if(abs(t(i)) <= T/2)
            y(i) = -1;
        else
            y(i) = 0;
        end
    end
end
plot(t,y);
Yf = fft(y);
Yf = fftshift(Yf);
N = length(t);
f = [-fs/2:fs/N:fs/2-fs/N];
size(f)
% plot(f,abs(Yf)/N);
% Y_real = real(Yf);
% Y_im = imag(Yf);
a_spec = abs(Yf);
figure
plot(f,(a_spec/N));
% phase_spec = atan(Y_im/Y_real);
phase_spec = angle(Yf);
figure
plot(f,phase_spec);

