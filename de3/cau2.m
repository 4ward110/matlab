a = 1;
b = 4;
N = 50;
delta = (b-a)/N;

total = 0;
for i=1:N
    x = [(2*a + delta)/2]
    fx = (x^3 + exp(x))*delta;
    total = total + fx;
    a = a + delta;
end
total