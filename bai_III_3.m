
x0 = 2;
x1 = (x0^2+2)/(2*x0);
sub = x0-x1;
while ((x0-x1)>0.00001)
    x0 = x1;
    x1 = (x0^2+2)/(2*x0);
end
disp('sqrt(2) = ');
disp(x1)