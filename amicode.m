% Ví d? v? bi?u di?n mã ???ng NRZ
function [t,y] = amicode(d,R,Ns)
% Chuong trinh vi du ve ma AMI
% d - the data sequence
% R - the data rate
% Ns - the number of samples
% t - the time vector output
% y - the vector output of the pulse samples
% type - the type of code (NRZ - 'NRZ' or RZ - 'RZ')

Tb = 1/R; % chu k? bit
Nb = length(d); % s? l??ng bit
Timewindow = Nb*Tb; % c?a s? th?i gian bi?u di?n
ts = Timewindow/(Ns-1); % chu k? l?y m?u
t = 0:ts:Timewindow; % vector th?i gian 
y = zeros(size(t));
% Nb = length(d);
size(d)
% s = 1;
for k = 1:Ns
    n = fix(t(k)/Tb) + 1;
    if n >= Nb
        n = Nb;
    end 
    if d(n)==0
        y(k)=0;
    else
        if mod(n,2)==0
            y(k)= 1;
        else
            y(k)= -1;
        end
    end
end
plot(t,y);

