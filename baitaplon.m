% X? lý ?nh
% assignment 1:
% - ??c ?nh & chuy?n ?nh sang chu?i nh? phân
% - Th?c hi?n chuy?n ??i ng??c l?i t? chu?i bit nh? phân => ?nh

% V? ??c Long - B18DCVT272
img = imread('flower.jpg'); %??c file ?nh 
im_info = imfinfo('flower.jpg'); % l?y thông tin c?a ?nh
im_size = size(img) % ??a ra kích th??c c?a ma tr?n ?nh ??u vào
imshow(img)
title('Original Image');

% chuy?n các ph?n t? c?a ma tr?n ?nh thành ma tr?n nh? phân
bi_img = de2bi(img); 

% ??a ra chi?u dài c?a chu?i bit
n_bits = length(bi_img) * length(bi_img(1,:)); 

%chuy?n ma tr?n ?nh nh? phân sang chu?i bit nh? phân
bits = reshape(bi_img,1,n_bits);

%chuy?n chu?i bit nh? phân sang ma tr?n nh? phân 
bi_matrix = reshape(bits, (n_bits/8), 8); 

%chuy?n ??i ma tr?n nh? phân sang ma tr?n th?p phân v?i kích th??c 
%t??ng ?ng v?i kích th??c ma tr?n ?nh ??u vào
inverse_img = reshape(bi2de(bi_matrix), im_size); 

figure
imshow(inverse_img) % hi?n th? ?nh sau khi chuy?n ??i ng??c
title('Recover Image');




