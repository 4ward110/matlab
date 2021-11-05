clc;
close all;
clear all;

K1 = 50;
K2 = 100;
K3 = 150;
K4 = 200;
Gp = 40;

x_dB = -20:1:20;
x = 10.^(x_dB/10);

u = 1./sqrt( (K1-1)/(2*Gp) + 1./(2.*x) );
BER = 0.5*erfc(u/sqrt(2));
plot(x_dB, BER, '-r');hold on;

u = 1./sqrt( (K2-1)/(2*Gp) + 1./(2.*x) );
BER = 0.5*erfc(u/sqrt(2));
plot(x_dB, BER, '-g');

u = 1./sqrt( (K3-1)/(2*Gp) + 1./(2.*x) );
BER = 0.5*erfc(u/sqrt(2));
plot(x_dB, BER, '-b');

u = 1./sqrt( (K4-1)/(2*Gp) + 1./(2.*x) );
BER = 0.5*erfc(u/sqrt(2));
plot(x_dB, BER, '-m');

ylabel('BER');
xlabel('Eb/N0 (dB)');
legend('K1 = 50','K2 = 100','K3 = 150','K4 = 200' );


