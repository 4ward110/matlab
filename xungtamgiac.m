function [t,y] = xungtamgiac(R,fs,Np)
%XUNGTAMGIAC Summary of this function goes here
%   Detailed explanation goes here
Tp = 1/R; %chu ky xung
f=@(t)1-abs((2*t-Tp)/Tp);
t = [];
st = [];
for k=0:Np-1
    t1 = [k*Tp:1/fs:(k+1)*Tp];
    st1 = f(t1-k*Tp);
    t = [t,t1];
    st = [st,st1];
end
plot(t,st)
end

