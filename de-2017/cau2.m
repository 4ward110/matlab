d = randint(1,100)
R = 50e6; %toc do bit
Ns = 2000; %so mau bieu dien

Tb = 1/R; %chu ki bit
Nb = length(d); %so luong bit
Timewindow = Nb*Tb; %tong thoi gian bieu dien
ts = Timewindow/(Ns - 1); %chu ki lay mau
t = 0:ts:Timewindow; %vector thoi gian

y = zeros(size(t));
% c = zeros(size(t));
code = [];
s = 1;
for i = 1:Nb
    if d(i) == 1
        s = s+1;
        if mod(s,2) == 0
            code(i) = 1;
        else
            code(i) = -1;
        end
    else
        code(i) = 0;
    end
end
code
for k = 1:Ns
    n = fix(t(k)/Tb)+1;
    if n >= Nb
        n = Nb;
    end
    y(k) = code(n);
end
plot(t,y,'linewidth',1,'color','b');
grid on;
ylim([-1.5 1.5])
