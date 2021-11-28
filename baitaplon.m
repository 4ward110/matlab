% X? l� ?nh
% assignment 1:
% - ??c ?nh & chuy?n ?nh sang chu?i nh? ph�n
% - Th?c hi?n chuy?n ??i ng??c l?i t? chu?i bit nh? ph�n => ?nh

% V? ??c Long - B18DCVT272
img = imread('flower.jpg'); %??c file ?nh 
im_info = imfinfo('flower.jpg'); % l?y th�ng tin c?a ?nh
im_size = size(img) % ??a ra k�ch th??c c?a ma tr?n ?nh ??u v�o
imshow(img)
title('Original Image');

% chuy?n c�c ph?n t? c?a ma tr?n ?nh th�nh ma tr?n nh? ph�n
bi_img = de2bi(img); 

% ??a ra chi?u d�i c?a chu?i bit
n_bits = length(bi_img) * length(bi_img(1,:)); 

%chuy?n ma tr?n ?nh nh? ph�n sang chu?i bit nh? ph�n
bits = reshape(bi_img,1,n_bits);

%chuy?n chu?i bit nh? ph�n sang ma tr?n nh? ph�n 
bi_matrix = reshape(bits, (n_bits/8), 8); 

%chuy?n ??i ma tr?n nh? ph�n sang ma tr?n th?p ph�n v?i k�ch th??c 
%t??ng ?ng v?i k�ch th??c ma tr?n ?nh ??u v�o
inverse_img = reshape(bi2de(bi_matrix), im_size); 

figure
imshow(inverse_img) % hi?n th? ?nh sau khi chuy?n ??i ng??c
title('Recover Image');




