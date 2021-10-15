x=(-3:0.1:3);
y=(-3:0.1:3)';
v=ones(length(x),1)


X=v*x;
Y=y*v'

% f=sin(X.^2+Y.^2).*exp(-0.2*(X.^2+Y.^2));
% mesh(x,y,f);
% title('ve ham f theo x y');
% xlabel('truc x');
% ylabel('truc y');
% 
% max(f);
