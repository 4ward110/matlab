close all;
%%%% Nguyễn Xuân Minh – B18DCVT294 – D18CQVT06-B %%%%%%%%
% Lấy chuỗi bit từ Nhiệm vụ 1
[image_size, bits, n_bits] = image2binary('flower.jpg');
% Tham số dầu vào
M = 64; % MSV: B18DCVT294 => M = 64, N = 4
N = 4;
Rb = N*1e6;
SNR_dB = [5 8 12];
SNR = 10.^(SNR_dB/10);
nb = log2(M); % Số bit biểu diễn 1 ký hiệu (bits/sym)
n_syms = floor(n_bits/nb); % Độ dài chuỗi ký hiệu
Tend = n_bits/Rb; % Thời gian mô phỏng toàn bộ chuỗi tín hiệu
Tb = 1/Rb; % Chu kì bit
Ts = M*Tb; % Chu kì ký hiệu
%-------------------------------------- Điều chế -----------------------------%
% Bộ điều chế QAM với đầu vào là ‘bit’
d = qammod(bits', M, 'InputType', 'bit'); % Trả về chuỗi d phức là chuỗi các mức của ký hiệu
%------------------------------- Tạo xung tín hiệu phát -------------------------%
n_sample = 100; % Số mẫu cho một ký hiệu
Es = 1; % Giả sử nặng lượng mỗi ký hiệu là 1
pha = 0; % Pha ban đầu
t_m= 0:Ts/n_sample:(Ts-Ts/100); % vector thời gian cho 1 ký hiệu
p_m = sqrt(2*Es/Ts)*(1-cos(2*pi*t_m/Ts)); % Tạo xung p(t) cho
% Đồng nhất độ dài của p(t) và d(k) với độ dài là (số mẫu) x (số ký hiệu)
p = kron(ones(1,n_syms), p_m);
d_s = kron(d.', ones(1,n_sample));
s = d_s.*p.*exp(i*pha); % Xung tín hiệu s(t) được tạo ra
% tạo vector thời gian với độ dài tương ứng s(t)
t = kron(ones(1,length(d')), t_m)+kron([0:Ts:((n_syms-1)*Ts)], ones(1,n_sample));
%--------------- Quá trình mô phỏng qua kênh AWGN --------------------%
BER = []; % Khởi tạo vector BER lưu BER tương ứng mỗi SNR
for i = 1:length(SNR) % SNR loop
 nMC = 10; % Số vòng lặp cho Monte Carlo loop
 err=0; % Biến err tính tổng số bit lỗi
 for j = 1:nMC %MC loop

 % Xung tín hiệu bị nhiễu qua kênh AWGN, 
 %‘measured’ dùng để đo công suất tín hiệu vào để tạo công suất nhiễu tương ứng, 
 %‘linear’ để xác định giá trị SNR vàolà kiểu tuyến tính, không phải kiểu dB
 sr = awgn(s, SNR(i), 'measured', 'linear');

 %------------------ Quá trình xử lý tín hiệu phía thu -----------------------%
 % Xác định mức tín hiệu cho xung tín hiệu của mỗi ký hiệu
 dra = max(reshape(sr,n_sample,n_syms));
 drb = max(p_m);
 dr =(dra/drb); % Chuỗi các mức của các ký hiệu tương ứng


 %--------------------------- Giải điều chế ----------------------------%
 % Bộ giải điều chế từ chuỗi các mức phức với đầu ra là bit
 % Giải điều chế
 bits_output = qamdemod(dr.',M,'OutputType','bit');
 %Tính số lượng bit lỗi
 err = err + length(bits(bits'~= bits_output));
  end %MC loop
 % Tính tỉ lệ bit lỗi
 BER(i) = err/(nMC*n_bits);

 %------------------------ Hien thi cac ket qua tai SNR=8 -----------------------%
 if SNR_dB(i)==8
 % Vẽ biểu đồ chòm sao
 scatterplot(d); title('Bieu do chom sao dau ra bo dieu che (SNR=8dB)'); grid;
 scatterplot(dr); title('Bieu do chom sao tai bo thu (SNR=8dB)'); grid;

 % Vẽ xung tín hiệu
 figure, plot(t, real(sr)); hold on;
 plot(t,real(s),'LineWidth',1.5); hold off;
 title('Xung tin hieu truoc va sau khi qua kenh AWGN (SNR=8dB)');
 legend('Tin hieu sau khi qua kenh AWGN sr(t)','Tin hieu ban dau s(t)');
 xlabel('t'); ylabel('Amplitude')
 axis([0 0.00015 -inf inf])

 % Vẽ mẫu mắt tín hiệu với 100 mẫu của mỗi ký hiệu
 eyediagram(s(1:1000),100);
 eyediagram(sr(1:1000),100);

 %Vẽ phổ tín hiệu
 [f,Xf] = spectrocal(t,real(s));
 figure, semilogy(f,Xf);grid; title('Pho tin hieu phia phat (SNR=8dB)');
 xlabel('t'); ylabel('PSD')
 [f,Xf] = spectrocal(t,real(sr));
 figure, semilogy(f,Xf);grid; title('Pho tin hieu phia thu (SNR=8dB)');
 xlabel('t'); ylabel('PSD')
 end % if

 % Quá trình khôi phục ảnh ứng với mỗi SNR
 img_bi= reshape(bits_output, (n_bits/8), 8);
 img_back = uint8(reshape(bi2de(img_bi), image_size));
 figure, imshow(img_back); title(['Anh khoi phuc tai SNR = ',num2str(SNR_dB(i))])

end % SNR loop
% In kết quả tỉ lệ lỗi bit BER cho từng trường hợp SNR
for i = 1:length(SNR_dB)
 fprintf('Tai SNR=%d , co BER = %f \n',SNR_dB(i),BER(i));
end