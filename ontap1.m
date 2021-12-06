% A = [1 -1; 2 2];
% B = [3 2; 1 1];
% % X = inv(A)*B
% % A*X 
% Y = B*inv(A);
% Y*A;
% t = 0:0.1:10;
% s  = 20*sin(2*pi*5*t)
% a = input('');
% b = input('');
% fa = -inf;
% fb = inf;
% while (b-a) > eps*1
%     c = (a + b)/2;
%     fx = c^3/3 + 4*c^2 +c -6;
%     if sign(fx) == sign(fa)
%         a = c;
%         fa = fx;
%     else
%         b = c;
%         fb = fx;
%     end
% end
% c

% a = -1.5;
% b = 1.5;
% N = 100;
% delta = (b-a)/N;
% tol = 0;
% for k = 1:N
%     x = a + (k-1/2)*delta;
%     f = 4*x^3*2*exp(x)*cos(x);
%     tol = tol + f;
% end
% tol*delta

% x0 = 8;
% root = 1.5;
% while x0 - root > 0.00001
%     x0 = root;
%     root = (x0^2 + 3)/(2*x0);
% end
% root

clc;
clear all;
close all;
a = 1;
r = 1;
h = 0.25;
y0 = 0;
f = @(t,y) r - a*y;
y_ex = @(t) 1-exp(-a*t); %nghiem giai tich

k1 = 0;     %Khoang thoi gian xet
k2 = 3;     
t0 = k1;
n = (k2-k1)/h;
t(1) = t0;
y(1) = y0;
for i =1:n
    t(i+1) = t(i) + h;
    y1(i+1) = y(i)+h*f(t(i),y(i));
    y(i+1) = y(i) + h/2*(f(t(i),y(i)) + f(t(i+1),y1(i+1)));
end
 
plot(t,y,'ro-','linewidth',1);
hold on
plot(t,y_ex(t),'b*-','linewidth',1);
title('Euler bien doi','fontsize',15,'color','b');
legend('Nghiem theo Euler bien doi','Nghiem giai tich');
xlabel('t','fontsize',15,'color','b');
ylabel('Nghiem','fontsize',15,'color','b');
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
disp (delta2)
 




