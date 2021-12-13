function x = invalaw(y,A)
%     if abs(y) < 1/(1+log(A))
    x = sign(y).*(abs(y).*(1+log(A))/A);
%     else if abs(y) >= 1/(1+log(A)) & abs(y) < 1
%         x = sign(y)*(exp(abs(y)*(1+log(A))-1)/A)
end

