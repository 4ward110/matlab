

img = imread('flower.jpg'); %??c file ?nh 
im_info = imfinfo('flower.jpg'); % l?y thông tin c?a ?nh
im_size = size(img) % ??a ra kích th??c c?a ma tr?n ?nh ??u vào
% imshow(img)
% title('Original Image');

% chuy?n các ph?n t? c?a ma tr?n ?nh thành ma tr?n nh? phân
bi_img = de2bi(img); 

% ??a ra chi?u dài c?a chu?i bit
n_bits = length(bi_img) * length(bi_img(1,:)); 

%chuy?n ma tr?n ?nh nh? phân sang chu?i bit nh? phân
bits = reshape(bi_img,1,n_bits);

M = 64;
N = 2;
Rb = N*1e6;
SNR_dB = [5 8 12];
SNR = 10.^(SNR_dB/10);
nb = log2(M);
n_syms = floor(n_bits/nb); %do dai chuoi ki hieu
Tend = n_bits/Rb
Tb = 1/Rb; %chu ki bit
Ts = M*Tb % chu ki ky hieu

%-----------------------Modulation---------------------------%
%64-QAM
seq = qammod(bits', M, 'InputType', 'bit');
%----------------------Create waveform-----------------------%
n_sample = 100; 
Es = 1;
phase = 0;
t_m = 0:Ts/n_sample:(Ts-Ts/100);
p_m = sqrt(2*Es/Ts)*(1-cos(2*pi*t_m/Ts));

p = kron(ones(1,n_syms), p_m);
d_s = kron(d.', ones(1,n_sample));
s = d_s.*p.*exp(i*phase);

t = kron(ones(1,length(seq')), t_m)+kron([0:Ts:((n_syms-1)*Ts)], ones(1,n_sample));











