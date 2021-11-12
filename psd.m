t = 0:255;
x = zeros(1, length(t));

x(1:20) = 1;
subplot(2,1,1);
plot(t,x)
grid on;
subplot(2,1,2);
[f,Xf] = spectrocal(t,x);
semilogy(f,Xf)
grid on;