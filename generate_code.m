k = 4;
for i = 1:2^4
    for j = k:-1:1
        if rem(i-1,2^(-j+k+1)) >= 2^(-j+k)
            u(i,j) = 1;
        else
            u(i,j) = 0;
        end
    end
end
g = [1 0 0 0 1 1 1;
    0 1 0 0 1 1 0;
    0 0 1 0 1 0 1;
    0 0 0 1 0 0 1];
c = mod(u*g,2)
w_min = min(sum((c(2:2^k,:))'))