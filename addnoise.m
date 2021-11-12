function yNoise = addnoise( yClean, VarN )
%ADDNOISE Summary of this function goes here
%   Detailed explanation goes here
if (isreal(yClean))
    yNoise = yClean + sqrt(VarN)*randn(size(yClean));
else
    yNoise = yClean + sqrt(VarN/2)*(randn(size(yClean))+j*randn(size(yClean)));
end

