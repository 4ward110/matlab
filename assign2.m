%V? ??c Long - B18DCVT272
clc;
clear;
close all;
[im_size, bits, bits_seq] = im2bi('flower.jpg');

%---------------------Thi?t l?p tham s? ??u v�o---------------------------%

M = 64;
N = 2;
Rb = N*1e6;
SNR_dB = [5 8 12];
SNR = 10.^(SNR_dB/10);
nb = log2(M); % S� bit bi?u di?n m?t k� hi?u
n_syms = floor(bits_seq/nb); % ?? d�i chu?i k� hi?u
Tend = bits_seq/Rb; % th?i gian m� ph?ng chu?i k� hi?u
Tb = 1/Rb; % Chu k� bit
Ts = M*Tb; % Chu k� k� hi?u
%-------------------------------------- ?i?u ch? --------------------------%

% ?i?u ch? 64 QAM
d = qammod(bits', M, 'InputType', 'bit'); %?i?u ch? 64-QAM v?i ??u ra l� m?c k� hi?u ? d?ng ph?c 
%------------------------------- T?o xung ph�t ----------------------------%

n_sample = 100; % S? m?u bi?u di?n cho m?t k� hi?u
Es = 1; % N?ng l??ng m?t k� hi?u
phase = 0; % Pha ban ??u
t_m = 0:Ts/n_sample:(Ts-Ts/100); % T?o vector th?i gian cho 1 k� hi?u 
p_m = sqrt(2*Es/Ts)*(1-cos(2*pi*t_m/Ts)); % T?o xung k� hi?u cho 1 k� hi?u
% ??ng nh?t ?? d�i xung k� hi?u cho chu?i k� hi?u
p = kron(ones(1,n_syms), p_m);

d_s = kron(d.', ones(1,n_sample));
s = d_s.*p.*exp(i*phase); %xung t�n hi?u ph�t s(t)
% T?o vector th?i gian v?i ?? d�i b?ng v?i ?? d�i t�n hi?u ph�t s(t)
t = kron(ones(1,length(d')), t_m)+kron([0:Ts:((n_syms-1)*Ts)], ones(1,n_sample));

%--------------- M� ph?ng m� h�nh k�nh AWGN -------------------------------%
BER = []; % T?o vector l?u gi� tr? BER
for i = 1:length(SNR) % L?p qua m?i gi� tr? SNR
 nMC = 10; % S? v�ng l?p Monte_carlo th?c hi?n
 err=0; % bi?n l?u gi� tr? l?i
 for j = 1:nMC %L?p Monte-carlo

 %??a xung t�n hi?u qua k�nh awgn
 sr = awgn(s, SNR(i), 'measured', 'linear');

 %------------------ X? l� t�n hi?u ph�a thu ------------------------------%
 dra = max(reshape(sr,n_sample,n_syms)); % X�c ??nh m?c t�n hi?u cho xung t�n hi?u thu ???c
 drb = max(p_m);
 dr =(dra/drb); % Chu?i c�c m?c k� hi?u t??ng ?ng

 %--------------------------- Gi?i ?i?u ch? --------------------------------%
 %Gi?i ?i?u ch? 64-qam 
 bits_output = qamdemod(dr.',M,'OutputType','bit');
 % So s�nh bit ph�t v?i bit thu ?? t�nh s? bit l?i
 err = err + length(bits(bits'~= bits_output));
 end % K?t th�c v�ng l?p monte-carlo
 %T�nh gi� tr? BER theo m?i SNR
 BER(i) = err/(nMC*bits_seq);

 %------------------------ Hien thi ket qua tai SNR = 8 --------------------%
 if SNR_dB(i)==8
 % V? ch�m sao t�n hi?u
 scatterplot(d); title('Bieu do chom sao 64-QAM sau dieu che (SNR=8dB)'); grid;
 scatterplot(dr); title('Bieu do chom sao 64-QAM tai phia thu (SNR=8dB)'); grid;

 % V? d?ng xung t�n hi?u
 figure, plot(t, real(sr)); hold on;
 plot(t,real(s),'LineWidth',1.5); hold off;
 title('Xung tin hieu truoc va sau khi dua qua kenh AWGN(SNR=8dB)');
 legend('Xung tin hieu sau khi dua qua kenh AWGN sr(t)','Xung tin hieu ban dau s(t)');
 xlabel('t'); ylabel('Amplitude')
 axis([0 0.00015 -inf inf])

 % V? bi?u ?? m?t t�n hi?u l�c ph�t v� thu
 eyediagram(s(1:1000),100);
 eyediagram(sr(1:1000),100);

 %V? m?t ?? ph? c�ng su?t t�n hi?u
 [f,Xf] = spectrocal(t,real(s));
 figure, semilogy(f,Xf);grid; title('Mat do pho cong suat phia phat (SNR=8dB)');
 xlabel('t'); ylabel('PSD')
 [f,Xf] = spectrocal(t,real(sr));
 figure, semilogy(f,Xf);grid; title('Mat do pho cong suat phia thu (SNR=8dB)');
 xlabel('t'); ylabel('PSD')
 end

 %Kh�i ph?c ?nh ph�a thu
 img_bi= reshape(bits_output, (bits_seq/8), 8);
 img_back = uint8(reshape(bi2de(img_bi), im_size));
 figure, imshow(img_back); title(['?nh kh�i ph?c t?i SNR = ',num2str(SNR_dB(i))])

end % K?t th�c v�ng l?p
% K?t qu? t? l? BER 
for i = 1:length(SNR_dB)
 fprintf('SNR=%d c� BER = %f \n',SNR_dB(i),BER(i));
end