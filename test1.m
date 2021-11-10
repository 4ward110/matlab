%B18DCVT272
%a=2 b=3 c = 10 N = 11 

%tao ma tran A don vi kich thuoc la 4
 A=eye(4)
 
 % Tao ma tran B toan gia tri 3
 
 B=ones(4,4);
 B=3*B;
% Ghep 2 ma tran A va B

C=[A B];

%tra ve kich thuoc ma tran C

[m n]=size(C) % m hang n cot

%doi gia tri hang a=2, cot a+2=4 sang gia tri 4

C(2,4)=4;
N = 11;
fprintf('%.2f \n',tich(N));