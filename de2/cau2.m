
% xf1 = -inf;
% xf2 = inf;
x1 = -1;
x2 = 2;

while (x2 - x1) > 0.0005
    x = (x2+x1)/2;
    fx = 3*x^4 - 7*x^2 + 2*x + 2;
    if sign(fx) ~= sign(x1)
        x2 = x;
    else
        x1 = x;
    end
end
x