function [im_size, bits, bits_seq] = im2bi(path)
% V? ??c Long - B18DCVT272
img = imread(path); %??c file ?nh
% img = imresize(img, [320 NaN]); %resize l?i k�ch th??c c?a ?nh
im_info = imfinfo(path) % l?y th�ng tin c?a ?nh
im_size = size(img) % ??a ra k�ch th??c ma tr?n ?nh v�o
imshow(img) %hi?n th? ?nh ??u v�o
title('Original Image');
% chuy?n ??i c�c ph?n t? ma tr?n ?nh ??u v�o t? th?p ph�n sang nh? ph�n
bi_img = de2bi(img);
size(bi_img)
% ??a ra ?? d�i chu?i bit
bits_seq = length(bi_img) * length(bi_img(1,:))
%Chuy?n ma tr?n ?nh nh? ph�n sang d?ng vector c� 1 h�ng v� bits_seq c?t
bits = reshape(bi_img,1,bits_seq);
size(bits)
%Chuy?n vector nh? ph�n 1 h�ng sang ma tr?n ?nh nh? ph�n
bi_matrix = reshape(bits, (bits_seq/8), 8);
size(bi_matrix)
%chuy?n ma tr?n ?nh nh? ph�n sang ma tr?n ?nh k�ch th??c b?ng ma tr?n ?nh ban ??u
inverse_img = reshape(bi2de(bi_matrix), im_size); 
figure
imshow(inverse_img) % hi?n th? ?nh sau khi t?o l?i
title('Recover Image');
end

