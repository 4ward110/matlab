% A = randi([-3 3],1,4)
% B = diag(A)
% C = [];
% temp = 1;
% for i = 1:4
%     C(:,temp) = B(:,i);
%     C(:,temp + 1) = abs(B(:,i));
%     temp = temp + 2;
% end
% C;
% D = nonzeros(C)'
%ham so
x=(0:0.005/92:3/48); %3 chu ki
y=exp(-0.5*x).*cos(2*pi*48*x);

%a)ve do thi ham so tren khoang 3 chu ki
plot(x,y);
%b)ve nhung diem mau tron do tai cac diem nguyen lan cua nua chu ki tren do thi
%c)chu thich truc tung, truc hoanh  va ten cho do thi
xlabel('Truc hoanh');
ylabel('Truc tung');