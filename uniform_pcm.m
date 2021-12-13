function [code,xq,sqnr] = uniform_pcm(x,M)
% x = input sequence
% M = number of quantization levels
% code = the encoded output
% xq = quantized sequence before encoding
% sqnr = signal to quantization noise ratio in dB
Nb = log2(M); % S? bit trên m?i t? mã
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
ind
sqnr = 20*log10(norm(x)/norm(x-xq)); % Tính t? s? trên nhi?u l??ng t?
code = de2bi(xcode,Nb,'left-msb'); % Chuy?n ??i sang t? mã nh? phân

