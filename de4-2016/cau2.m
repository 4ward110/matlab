% hist(d,2);
M = 2;
d = randint(1,500,M);
y = dpskmod(d,M);
scatterplot(y,1,0,'ob');

Rb = 1000;
Tb = 1/Rb;
Nb = length(d);
fs = 20*Rb;
Ns = 256;
TimeWin = Nb*Tb;
ts = TimeWin/(Ns-1);
t = -TimeWin/2:ts:TimeWin/2;
size(t)
p = zeros(1,length(t));
for i=1:length(t)
    if(abs(t(i)) <= Tb/2)
        p(i) = 1;
    else
        p(i) = 0;
    end
end
p = sqrt(2/Tb)*p;
size(p)
plot(t,p)






