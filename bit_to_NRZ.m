d = randint(1,5000);
R = 100e6;
Ns = 2000;

[t,y] = nrzcode(d,R,Ns,'pol');
y1 = y(:,1:10)
tr = t(:,1:10)
subplot(3,1,1)
plot(tr,y1)
Ts = t(2)-t(1);

[yr] = raisecosflt(y,300e6,Ts,0.5);
y2 = yr(:,1:10)
subplot(3,1,2)
plot(tr,y2)
eyediagram(yr,2)
eyediagram(y,2)


