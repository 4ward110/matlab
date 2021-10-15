r = 3;
th = 0:pi/50:2*pi;
xunit = r * cos(th);
yunit = r * sin(th);
plot(xunit, yunit);
axis equal

perimeter = 2*pi*r;
sprintf('%.5f',perimeter)

area = pi*r^2;
sprintf('%.5f',area)