f1=input('Nhap tan so f can khao sat: ')
B=input('Nhap nua do rong xung: ')

f=[-f1:0.01:f1]

rect=zeros(1,length(f))

rect(f>=-B&f<=B)=1

H=exp(-j*2*pi*f).*rect

subplot(2,1,1)

plot(f,abs(H))

xlabel('f')
ylabel('abs(H)')

title('Dap ung bien do cua ham truyen dat H')

axis([-10 10 -0.1 1.1])
subplot(2,1,2)

plot(f,angle(H))

xlabel('f')

ylabel('phase(H)')

title('Dap ung pha cua ham truyen dat H')

axis([-10 10 -4 4])

h = ifft(H)


figure
plot(h);
title('Dap ung xung trong mien thoi gian')

