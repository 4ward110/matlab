function [im_size, bits, bits_seq] = im2bi(path)
% V? ??c Long - B18DCVT272
img = imread(path); %??c file ?nh
img = imresize(img, [320 NaN]); %resize l?i kích th??c c?a ?nh
im_info = imfinfo(path); % l?y thong tin c?aa ?nh
im_size = size(img) % ??a ra kích th??c ma tr?n ?nh vào
imshow(img) %hi?n th? ?nh ??u vào
title('Original Image');
% chuy?n các ph?n t? ma tr?n ?nh ??u vào t? th?p phân sang nh? phân
bi_img = de2bi(img); 

% ??a ra ?? dài chu?i bit
bits_seq = length(bi_img) * length(bi_img(1,:)); 

%chuy?n ma tr?n ?nh nh? phân sang d?ng vector 1 hàng
bits = reshape(bi_img,1,bits_seq);

%chuy?n vector nh? phân 1 hàng sang ma tr?n ?nh nh? phân
bi_matrix = reshape(bits, (bits_seq/8), 8); 

%chuy?n ma tr?n ?nh nh? phân thành ma tr?n ?nh 
inverse_img = reshape(bi2de(bi_matrix), im_size); 

figure
imshow(inverse_img) % hi?n th? ?nh sau khi t?o l?i
title('Recover Image');

end

