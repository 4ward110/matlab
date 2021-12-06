% Ví d? v? bi?u di?n mã ???ng NRZ
function [t,y,code] = amicode(d,R,Ns,type)
% Chuong trinh vi du ve ma AMI
% d - the data sequence
% R - the data rate
% Ns - the number of samples
% t - the time vector output
% y - the vector output of the pulse samples
% type - the type of code (NRZ - 'NRZ' or RZ - 'RZ')
...
y = zeros(size(t));
code = [];
...
s = 1;
for k = 1:Nb
 if d(k) == 0
 code(k) = 0;
 else
 s = s+1;
 if mod(s,2)==0
 code(k) = 1;
 else
 code(k) = -1;
 end
 end
end
...

