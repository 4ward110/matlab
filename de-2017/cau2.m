d = randint(1,2000)
R = 50e6; %toc do bit
Ns = 4e4; %so mau bieu dien
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
% code
for k = 1:Ns
    n = fix(t(k)/Tb)+1;
    if n >= Nb
        n = Nb;
    end
    y(k) = code(n);
end
% plot(t,y,'linewidth',1,'color','b');
% grid on;
% ylim([-1.5 1.5])
% figure

% function yf = butterwflt(x,n,B,Ts)
B = 150e6;
n = 5;
Ns = length(y);
f = [0:Ns/2-1 -Ns/2:-1]/(Ns*ts);
Xf = fft(y);
Hf = 1./(1+(f./B).^(2*n));
Yf = Xf.*Hf;
yf = ifft(Yf);

t5 = 0:ts:5*Tb;
size(t5)
y2 = y(1:length(t5));
size(y2)
yf2 = yf(1:length(t5));
size(yf2)
% y2 = [0:length(t5)];
% yf2 = [0:length(t5)];
plot(t5,y2,t5,yf2);grid;

% Ts = t(2) - t(1);
% f2 = (-Ns/2:Ns/2-1)/(Ns*Ts);
% Pf = fft(yf,Ns);
% Pf = fftshift(Pf)/Ns;
% Pf = abs(Pf).^2;
% 
% figure
% semilogy(f2,Pf);grid;


