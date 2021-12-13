%bai34
function [t, y, code] = rzcode(h,R,Ns)
%Ns: so luong mau
Tb = 1/R; %chu ki bit
Nb = length(h);
Timewin = Nb*Tb;
ts = Timewin/(Ns-1);
t = 0:ts:Timewin;
y = zeros(length(t));
code = [];
for k = 1:Ns
    n = fix(t(k)/Tb) + 1;
    if (n > Nb)
        n = Nb;
    end
    if mod(t(k),Tb) <= Tb/2
        y(k) = h(n);
    else
        y(k) = 0;
    end;
end
plot(t,y)
end