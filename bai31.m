x = randint(1,128); %t?o vector 128 phân b? ??u
%chuy?n chu?i thành các giá tr? th?p phân t? 0-15
xr = reshape(x,32,4);
size(xr)
reshape(bi2de(xr),1,32)

