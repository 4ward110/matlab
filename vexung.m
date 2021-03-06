% function [ out ] = vexung( b,a,N )
%     T = b;
%     temp = 0;
%     for i = 1 : N 
%         x = (temp:T/5:T*i);
%         bt = exp(-a.*x);
%         plot(x,bt); hold on;
%         temp = i*T;
%     end
%     xlabel('truc hoanh');
%     ylabel('truc tung'); 
% end

function y = vexung(b, a, N)
T = b - 3
t1 = (0:T/100:T-T/100);
y1 = exp(-a*t1);
t = t1;
y = y1;
for i = 1:N-1
    t = [t t1+i*T];
    y = [y y1];
end
plot(t,y)
end
