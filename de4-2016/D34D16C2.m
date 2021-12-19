% D16 - D4 - C2
clc;
clear all;

N = 500;
M = 2; % PSK
d = randi([0 M-1],1,N);
% ============ b ======================

d_m = pskmod(d,M,0,'gray'); %dieu che psk v?i M=2 muc dieu che, co ma hoa gray
scatterplot(d_m,1,0,'or');
% =========== c ======================

R = 1e3 ; 
T = 1/R; % Chu ky bit
t =0:T/1000:T ; 
tmp = t <= T/2;
pt =  (sqrt(2/T))*tmp;

yR = real(d_m);
ym=[];
tm=[];
for i = 1 : length(d_m)
    ym = [ym yR(i)*pt];
    tm = [tm t+(i-1)*T];    
end
% =========== d ======================
figure(2);
plot(t,pt);
figure(3)
plot(tm,ym)
axis([0 5*T -inf inf]);
grid on;
eyediagram(d_m,16);