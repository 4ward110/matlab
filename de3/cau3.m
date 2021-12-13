t = [0:0.01:1];
size(t)
N = 5;
y = []; %length 101
tr = [];
i = 0;
while i <= N
    if (i < N)
        for k = 1:length(t)
            yk(k) = exp(t(k));
            tk(k) = t(k);
        end
        y = [y yk];
        tr = [tr tk];
        i = i + 1;
    else
%         y = [y 1]
        i = i + 1;
    end
end
f = [0:1/(max(t)-min(t)):N*length(t)];
size(f)
Fx = fft(y,length(y));
Fx2 = fftshift(Fx);
size(Fx2)
plot(f,Fx2)

