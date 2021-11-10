function [m] = tich(N)
%TICH Summary of this function goes here
%   Detailed explanation goes here
a = 2;
m = 1;
for i=1:N
    b = (a*i+5)/2;
    b = sqrt(b);
    c = b + i^2;
    m = m*c;
end

