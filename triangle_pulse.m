function [ output_args ] = triangle_pulse(Tp,n)
Tw = Tp/2;
%Tp: chu ki xung
for i = 1:n-1
    x = [i*Tp:0.0001:(i+1)*Tp];
    f = 1 - abs(((x - i*Tp) - Tw)/Tw);
    plot(x,f);
    hold on;
end


end

