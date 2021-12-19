function [t,y] = chuoixung(R,Np)

Tp = 1/R;
fs = 16*R;
ts = 1/fs;

for i = 0:Np-1
    t = (i*Tp):ts:(i+1)*Tp;
    y = exp(-4*(t-i*Tp)/Tp);
    plot(t,y)
    hold on
    grid on
end
