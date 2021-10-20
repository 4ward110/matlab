T = 10;

Tw = T/2;
t=[-Tw:0.01:Tw];

P = 1 - abs(t)/Tw;

plot(t,P);