%V? ??c Long - B18DCVT272
clc;
clear;
close all;
[im_size, bits, bits_seq] = im2bi('flower.jpg');

% Thi?t l?p tham s? ??u vào
M = 64;
N = 2;
Rb = N*1e6;
SNR_dB = [5 8 12];
SNR = 10.^(SNR_dB/10);
nb = log2(M); % s? bit bi?u di?n 1 ký hi?u
n_syms = floor(bits_seq/nb); % ?? dài chu?i kí hi?u
Tend = bits_seq/Rb; % th?i gian mô ph?ng chu?i kí hi?u
Tb = 1/Rb; % Chu kì bit
Ts = M*Tb; % Chu kì ký hi?u
%-------------------------------------- ?i?u ch? -----------------------------%
% ?i?u ch? 64 QAM
d = qammod(bits', M, 'InputType', 'bit'); %?i?u ch? 64-QAM v?i ??u ra chu?i ph?c
%------------------------------- T?o xung phát -------------------------%
n_sample = 100; % S? m?u cho 1 ký hi?u
Es = 1; % N?ng l??ng m?t ký hi?u
phase = 0; % Pha ban ??u
t_m= 0:Ts/n_sample:(Ts-Ts/100); % t?o Vector th?i gian cho ký hi?u
p_m = sqrt(2*Es/Ts)*(1-cos(2*pi*t_m/Ts)); % T?o xung P(t)
% ??ng nh?t ?? dài
p = kron(ones(1,n_syms), p_m);

d_s = kron(d.', ones(1,n_sample));
s = d_s.*p.*exp(i*phase); %xung tín hi?u s(t)
% T?o vector th?i gian
t = kron(ones(1,length(d')), t_m)+kron([0:Ts:((n_syms-1)*Ts)], ones(1,n_sample));
%--------------- Mô ph?ng mô hình kênh AWGN --------------------%
BER = []; % t?oo vector l?u giá tr? BER
for i = 1:length(SNR) % L?p qua m?i giá tr? SNR
 nMC = 10; % S? vòng l?p Monte_carlo th?c hi?n
 err=0; % bi?n l?u giá tr? l?i
 for j = 1:nMC %L?p Monte-carlo

 %??a xung tín hi?u qua kênh awgn
 sr = awgn(s, SNR(i), 'measured', 'linear');

 %------------------ X? lý tín hi?u phía thu -----------------------%
 dra = max(reshape(sr,n_sample,n_syms)); % Xác ??nh m?c tín hi?u cho xung tín hi?u
 drb = max(p_m);
 dr =(dra/drb); % Chu?i các m?c ký hi?u t??ng ?ng

 %--------------------------- Gi?i ?i?u ch? ----------------------------%
 %Gi?i ?i?u ch? 64-qam 
 bits_output = qamdemod(dr.',M,'OutputType','bit');
 % So sánh bit phát v?i bit thu ?? tính s? bít l?i
 err = err + length(bits(bits'~= bits_output));
 end %k?t thúc l?p monte carlo
 %tính t? l? l?i bit trên m?i giá tr? SNR
 BER(i) = err/(nMC*bits_seq);

 %------------------------ Hien thi cac ket qua tai SNR = 5 -----------------------%
 if SNR_dB(i)==5
 % V? chòm sao tín hi?u
 scatterplot(d); title('Bieu do chom sao 64-QAM sau dieu che (SNR=5dB)'); grid;
 scatterplot(dr); title('Bieu do chom sao tai phia thu (SNR=5dB)'); grid;

 % V? d?ng xung tín hi?u
 figure, plot(t, real(sr)); hold on;
 plot(t,real(s),'LineWidth',1.5); hold off;
 title('Xung tin hieu truoc va sau khi qua kenh AWGN (SNR=5dB)');
 legend('Tin hieu sau khi qua kenh AWGN sr(t)','Tin hieu ban dau s(t)');
 xlabel('t'); ylabel('Amplitude')
 axis([0 0.00015 -inf inf])

 % V? bi?u ?? m?t tín hi?u lúc phát và thu
 eyediagram(s(1:1000),100);
 eyediagram(sr(1:1000),100);

 %V? ph? tín hi?u
 [f,Xf] = spectrocal(t,real(s));
 figure, semilogy(f,Xf);grid; title('Pho tin hieu phia phat (SNR=5dB)');
 xlabel('t'); ylabel('PSD')
 [f,Xf] = spectrocal(t,real(sr));
 figure, semilogy(f,Xf);grid; title('Pho tin hieu phia thu (SNR=5dB)');
 xlabel('t'); ylabel('PSD')
 end

 %Khôi ph?c ?nh phía nh?n 
 img_bi= reshape(bits_output, (bits_seq/8), 8);
 img_back = uint8(reshape(bi2de(img_bi), im_size));
 figure, imshow(img_back); title(['Anh khoi phuc tai SNR = ',num2str(SNR_dB(i))])

end % K?t thúc vòng l?p
% K?t qu? t? l? BER 
for i = 1:length(SNR_dB)
 fprintf('SNR=%d co BER = %f \n',SNR_dB(i),BER(i));
end