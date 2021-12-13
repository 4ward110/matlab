M = 16;
d = randint(1,1500,M);
dc = qammod(d,M);
No = 10;
Es = 5e-5;
phase = 0;
Rs = 1e6; %toc do ky hieu
Ts = 1/Rs; %chu ki 1 ky hieu
fs = 32*Rs; %tan so lay mau
t = 0:1/fs:length(dc)*Ts; %chuoi thoi gian
c = 1;
for i=1:length(t)
    Tx(i)=dc(c)*sqrt(2*Es/Ts)*exp(j*phase);
    if(t(i) >= c/Rs)
        c = c+1;
    end
end

noise = sqrt(No/2)*(randn(1,length(Tx)) + i*randn(1,length(Tx)));
Rx = Tx + noise;

d = 1;
for i=1:length(t)
    if (abs(t(i) - (d-1/2)/Rs)) <= 1/(2*fs)
        mucthu(d)=Rx(i)/(sqrt(2*Es/Ts))*exp(j*phase);
        d = d + 1;
    end
end
giaidieuche = qamdemod(mucthu,M);

plot(t(1:1000),Tx(1:1000))
figure;
plot(t(1:1000),Rx(1:1000))

