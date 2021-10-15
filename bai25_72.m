%bai25
% Giai phuong trinh vi phan su dung Runge-Kutta bac 3
clc; 
clear all; 
close all;
a = 1;
r = 72;
y0 = 0;
f = @(t,y) r - a*y;
y_ex = @(t) (y0 - r/a)*exp(-a*t) + r/a;
 
k1 = 0; 
k2 = 3; 
h = 0.25;
t0 = k1;
n = (k2-k1)/h;
 
t(1) = t0;
y(1) = y0;
 
for k = 1:n
    k1 = h*f(t(k),y(k));
    k2 = h*f(t(k)+2/3*h,y(k)+2/3*k1);
    k3 = h*f(t(k)+2/3*h,y(k)+2/3*k2);
    y(k + 1) = y(k) + (2*k1 + 3*k2 + 3*k3)/8; % RK-3
    t(k+1) = t(k) + h;
end
 
plot(t,y,'ro--','linewidth', 1)
hold on
plot(t, y_ex(t),'b*-','linewidth', 1)
legend('3th Runge-kutta', 'Exact')
title('Bieu dien nghiem phuong trinh vi phan bang  Runge-Kutta bac 3','Fontname','VnTime','color','b','Fontsize',11);
grid on
 
%So sanh cac nghiem voi nghiem giai tich
for i = 1:n
    if t(i) == 1
        yy1 = y(i);
    else
        if t(i) == 2
            yy2 = y(i);
        end
    end
end
 
delta1 = abs(y_ex(1) - yy1);
delta2 = abs(y_ex(2) - yy2);
disp ('Sai so so voi nghiem giai tich tai t = 1')
disp (delta1);
disp ('Sai so so voi nghiem giai tich tai t = 2')
disp (delta2);
