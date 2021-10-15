%help elfun : list all math function in matlab

t = (0:0.01:2);

s = sin(t);

sinfct = sin(2*pi*5*t);
cosfct = 2*cos(2*pi*3*t);
expfct = exp(-2*t);
plot(t,[sinfct; cosfct; expfct])

% help graph2d help graph3d
%de bieu dien ham sin 1 cách chính xác chsung ta nên ch?n t?n s? l?y m?u
%f=2fmax

cnum = [1+j, j, 2+j, 3+j, 2-2*j, -j];

% tính ?? dài vector
magn = abs(cnum);

%tính pha c?a vector theo radian
phase = angle(cnum);

%chuy?n ??i pha rad sang ??
deg = angle(cnum)*360/(2*pi);

% ... use to 
meas=[25.5 16.3 18.0; ...
    2.0 6.9 3.0; ...
    0.05 4.9 1.1];

dBmeans = 20*log10(meas);

