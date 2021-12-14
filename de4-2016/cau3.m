y0 = 0;
h = 0.01;
tf = 2;
t = 0:0.01:tf;
t0 = 0;
klast = (tf-t0)/h;

y(1) = y0;
tvec(1) = t0;

for k = 1:klast
%     y1(k+1) = y(k) + h*(cos(t(k))- sin(t(k)));
    y(k+1) = y(k) + h/2*[(cos(t(k))-sin(t(k)) + (cos(t(k+1))+sin(t(k+1))))];
end


plot(t,y);


