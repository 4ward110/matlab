%%%% Nguyễn Xuân Minh – B18DCVT294 – D18CQVT06-B %%%%%%%%
function [image_size, bits, n_bits] = image2binary(input_path)
%%%%%%%%%%%% Quá trình chuyển ảnh thành chuỗi nhị phân %%%%%%
%Đọc file ảnh, trả về ma trận A ba chiều
A = imread(input_path);
A = imresize(A, [320 NaN]);
image_size = size(A); %Lấy kích thước của ảnh
%Chuyển các phần tử từ ma trận ảnh thành ma trận nhị phân
B = de2bi(A);
%Chuyển ma trận nhị phân thành chuỗi nhị phân
n_bits = length(B) * length(B(1,:)); %Lấy độ dài chuỗi bit
bits = reshape(B,1,n_bits);


%Chuyển chuỗi nhị phân thành ma trận nhị phân
Br = reshape(bits, (n_bits/8), 8);
%Chuyển ma trận nhị phân thành ma trận ảnh theo size ảnh gốc
Ar = reshape(bi2de(Br), image_size);
%Hiển thị ảnh thu được
imshow(Ar);
title('Anh duoc chuyen doi tu chuoi bit');
%Hiển thị size ảnh, thông tin định dạng ảnh, độ dài chuỗi bit
image_size
imfinfo('flower.jpg')
n_bits