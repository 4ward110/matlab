fc = 300; %tan so song mang
%fs >= 2fc + B
fs = 8000; %tan so lay mau
t = 0:1/fs:0.5;
s = 2*cos(20*pi*t+pi/4) + cos(30*pi*t) %tin hieu tuong tu
subplot(3,1,1)
plot(t,s)
am = ammod(s,fc,fs); %dieu che bien do
subplot(3,1,2)
plot(t,am)
adm = amdemod(am,fc,fs); %giai dieu che
subplot(3,1,3)
plot(t,adm)