fs = 20;
ts = 1/fs;
t = 0:ts:4;
x = 2*cos(4*pi*t)
stem(t,x)
M = 8;
A = 87.6;
[y,amax] = alaw(x,A);
% stem(y)
amax
[code,yq,sqnr] = uniform_pcm(y,M);
% stem(yq);
code(1:5,:)
xq = invalaw(yq,A);
xq = xq*amax;