% clc;
% x = 0:10;
% y = sin(x);
% xi = 0:.25:10; % Các ?i?m l?y m?u m?i
% ylin = interp1(x,y,xi,'linear'); % N?i suy tuy?n tính
% yspl = interp1(x,y,xi,'spline'); % N?i suy spline
% plot(x,y,'o',xi,ylin,'-*', xi,yspl,'-x');

%random source data
% x = rand() %phan bo deu
% x = randn(1,1000) %phan bo chuan
% x = m + sqrt(v)*randn(m,n) %phan bo chuan co trung binh bang m va phuong sai  v