%Bai 1:
M = [1 0 0;0 i 1;i i+1 -3];
k = 2.75;
v = [1;3;-7;-0.5];
w = [1 -5.5 -1.7 -1.5 3 -10.7];
y = [1:0.5:100.5];



%Bài 2:

%Khai trien ma tran V 6x6
V = [M M;M M];

%Xoa hang 2 tu ma tran V
V(2,:)=[]

%Xoa cot 3 tu ma tran V
V(:,3)=[]

%T?o vector z t? hàng 4 c?a ma tr?n V

z = V(4,:)

% ??i giá tr? t?i V(4,2) thành j+5
V(4,2)= i+5
