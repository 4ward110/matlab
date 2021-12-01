%V? ??c Long - B18DCVT272
clc;
clear;
close all;
[im_size, bits, bits_seq] = im2bi('flower.jpg');

% Thi?t l?p tham s? ??u v�o
M = 64;
N = 2;
Rb = N*1e6;
SNR_dB = [5 8 12];
SNR = 10.^(SNR_dB/10);
nb = log2(M); % s? bit bi?u di?n 1 k� hi?u
n_syms = floor(bits_seq/nb); % ?? d�i chu?i k� hi?u
Tend = bits_seq/Rb; % th?i gian m� ph?ng chu?i k� hi?u
Tb = 1/Rb; % Chu k� bit
Ts = M*Tb; % Chu k� k� hi?u
%-------------------------------------- ?i?u ch? -----------------------------%
% ?i?u ch? 64 QAM
d = qammod(bits', M, 'InputType', 'bit'); %?i?u ch? 64-QAM v?i ??u ra chu?i ph?c
%------------------------------- T?o xung ph�t -------------------------%
n_sample = 100; % S? m?u cho 1 k� hi?u
Es = 1; % N?ng l??ng m?t k� hi?u
phase = 0; % Pha ban ??u
t_m= 0:Ts/n_sample:(Ts-Ts/100); % t?o Vector th?i gian cho k� hi?u
p_m = sqrt(2*Es/Ts)*(1-cos(2*pi*t_m/Ts)); % T?o xung P(t)
% ??ng nh?t ?? d�i
p = kron(ones(1,n_syms), p_m);

d_s = kron(d.', ones(1,n_sample));
s = d_s.*p.*exp(i*phase); %xung t�n hi?u s(t)
% T?o vector th?i gian
t = kron(ones(1,length(d')), t_m)+kron([0:Ts:((n_syms-1)*Ts)], ones(1,n_sample));
%--------------- M� ph?ng m� h�nh k�nh AWGN --------------------%
BER = []; % t?oo vector l?u gi� tr? BER
for i = 1:length(SNR) % L?p qua m?i gi� tr? SNR
 nMC = 10; % S? v�ng l?p Monte_carlo th?c hi?n
 err=0; % bi?n l?u gi� tr? l?i
 for j = 1:nMC %L?p Monte-carlo

 %??a xung t�n hi?u qua k�nh awgn
 sr = awgn(s, SNR(i), 'measured', 'linear');

 %------------------ X? l� t�n hi?u ph�a thu -----------------------%
 dra = max(reshape(sr,n_sample,n_syms)); % X�c ??nh m?c t�n hi?u cho xung t�n hi?u
 drb = max(p_m);
 dr =(dra/drb); % Chu?i c�c m?c k� hi?u t??ng ?ng

 %--------------------------- Gi?i ?i?u ch? ----------------------------%
 %Gi?i ?i?u ch? 64-qam 
 bits_output = qamdemod(dr.',M,'OutputType','bit');
 % So s�nh bit ph�t v?i bit thu ?? t�nh s? b�t l?i
 err = err + length(bits(bits'~= bits_output));
 end %k?t th�c l?p monte carlo
 %t�nh t? l? l?i bit tr�n m?i gi� tr? SNR
 BER(i) = err/(nMC*bits_seq);

 %------------------------ Hien thi cac ket qua tai SNR = 5 -----------------------%
 if SNR_dB(i)==5
 % V? ch�m sao t�n hi?u
 scatterplot(d); title('Bieu do chom sao 64-QAM sau dieu che (SNR=5dB)'); grid;
 scatterplot(dr); title('Bieu do chom sao tai phia thu (SNR=5dB)'); grid;

 % V? d?ng xung t�n hi?u
 figure, plot(t, real(sr)); hold on;
 plot(t,real(s),'LineWidth',1.5); hold off;
 title('Xung tin hieu truoc va sau khi qua kenh AWGN (SNR=5dB)');
 legend('Tin hieu sau khi qua kenh AWGN sr(t)','Tin hieu ban dau s(t)');
 xlabel('t'); ylabel('Amplitude')
 axis([0 0.00015 -inf inf])

 % V? bi?u ?? m?t t�n hi?u l�c ph�t v� thu
 eyediagram(s(1:1000),100);
 eyediagram(sr(1:1000),100);

 %V? ph? t�n hi?u
 [f,Xf] = spectrocal(t,real(s));
 figure, semilogy(f,Xf);grid; title('Pho tin hieu phia phat (SNR=5dB)');
 xlabel('t'); ylabel('PSD')
 [f,Xf] = spectrocal(t,real(sr));
 figure, semilogy(f,Xf);grid; title('Pho tin hieu phia thu (SNR=5dB)');
 xlabel('t'); ylabel('PSD')
 end

 %Kh�i ph?c ?nh ph�a nh?n 
 img_bi= reshape(bits_output, (bits_seq/8), 8);
 img_back = uint8(reshape(bi2de(img_bi), im_size));
 figure, imshow(img_back); title(['Anh khoi phuc tai SNR = ',num2str(SNR_dB(i))])

end % K?t th�c v�ng l?p
% K?t qu? t? l? BER 
for i = 1:length(SNR_dB)
 fprintf('SNR=%d co BER = %f \n',SNR_dB(i),BER(i));
end