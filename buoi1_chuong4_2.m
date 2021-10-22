% Bai 31
%tao chuoi bit ngau nhien phan bo deu 128 bit. chuyen chuoi bit nay thanh
%cac gia tri thap phan tu 0-15

data= randi([0,1],1,128)

y = reshape(data, length(data)/4,4);

bi2de(y,'left-msb');


