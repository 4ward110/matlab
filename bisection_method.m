a = input('x1= ');
b = input('x2= ');

fa = -inf;
fb = inf;

while (b-a) >= eps*b
    x = (a+b)/2;
    fx = x^3/3 + 4*x*x + x - 6;
    if fx == 0
        break;
    end
        
    if sign(fx) == sign(fa)
        a = x;
        fa = fx;
    else
        b = x;
        fb = x;
    end;
end
disp('Nghiem cua phuong trinh: ')
x