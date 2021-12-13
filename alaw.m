function [y,amax] = alaw(x,A)
    y = x;
    if abs(x) < 1/A
        y = sign(x)*A.*abs(x)/(1+log(A));
    else if abs(x) >= 1/A & abs(x) <= 1
        y = sign(x)*(1+log(A.*abs(x)))/(1+log(A));
        end
    end
    amax = max(abs(x));
end
