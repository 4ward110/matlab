% N = 20 + 72 =92

N = 92;
upper = 1.5;
lower = -1.5;
total = 0;

delta = (upper - lower)/N;

for k = 1:N
    midpoint = lower + (k - 1/2)*delta;
    
    fx = 4*x^3*2*exp(x)*cos(x);
    
    total = total + fx;
end

total = total*delta;
disp('Gia tri tich phan la:')
total
    

