function [code,xq,sqnr] = uniform_pcm(x,M)
% Uniform PCM encoding of a sequence
% x = input sequence
% M = number of quantization levels
% code = the encoded output
% xq = quantized sequence before encoding
% sqnr = signal to quantization noise ratio in dB
% Written by Nguyen Duc Nhan - 2012
Nb = log2(M);
Amax = max(abs(x));
delta = 2*Amax/(M-1);
Mq = -Amax:delta:Amax;
Ml = 0:M-1;
xq = zeros(size(x));
xcode = xq;
for k = 1:M
ind = find(x > Mq(k)-delta/2 & x <= Mq(k)+delta/2);
xq(ind) = Mq(k);
xcode(ind) = Ml(k);
end
sqnr = 20*log10(norm(x)/norm(x-xq));
code = de2bi(xcode,Nb,'left-msb');

