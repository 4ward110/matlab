% bai9
% t = [0:0.1:10];
% s = sin(2*pi*5*t).*cos(2*pi*3*t)+exp(-0.1*t)

%Bai 10
% 
% t = [0:0.1:10];
% s = sin(2*pi*5*3*t).*sin(2*pi*5*3*t)

%Bai 11

% t = [0:0.1:10];
% 
% s = 20*sin(2*pi*5*t)
% s = round(s)

%Bai 12

% b = [1024 1000 100 2 1];
% 
% x = log10(b)
% 
% y = log2(b)

%Bai 13

% w = (0.01:0.01:5);
% H1 = 1./(j*w);
% H2 = 1./ (1 + (j*w));

%Do thi H1
% figure
% subplot(2,2,1)
% plot(w, abs(H1));
% title('Ham h1 theo w');
% xlabel('w [rad/s]');
% ylabel('H1');
% grid on
% 
% subplot(2,2,2)
% loglog(w,abs(H1)); 
% title('Do thi loglog');
% xlabel('log(w) [rad/s]');
% ylabel('log(H1)');
% grid on
% 
% subplot(2,2,3)
% semilogx(w, abs(H1)); 
% title('Do thi bien do semilog x');
% xlabel('log(w) [rad/s]');
% ylabel('H1');
% grid on
% 
% subplot(2,2,4)
% semilogy(w,abs(H1));
% title('Do thi bien do semilog y');
% xlabel('w [rad/s]');
% ylabel('log(H1)');
% grid on
% 
% % Do thi ham H2
% figure
% 
% subplot(2,2,1)
% plot(w, abs(H2));
% title('Ham h2 theo w');
% xlabel('w [rad/s]');
% ylabel('H2');
% grid on
% 
% subplot(2,2,2)
% loglog(w,abs(H2)); 
% title('Do thi loglog');
% xlabel('log(w) [rad/s]');
% ylabel('log(H2)');
% grid on
% 
% subplot(2,2,3)
% semilogx(w, abs(H2)); 
% title('Do thi bien do semilog x');
% xlabel('log(w) [rad/s]');
% ylabel('H2');
% grid on
% 
% subplot(2,2,4)
% semilogy(w,abs(H2));
% title('Do thi bien do semilog y');
% xlabel('w [rad/s]');
% ylabel('log(H2)');
% grid on

% %Bai 14:
% 
% w = (0.01:0.01:5);
% H1 = 1./(j*w);
% H2 = 1./ (1 + (j*w));
% 
% %Do thi bien do va pha H1
% figure
% subplot(1,2,1)
% plot(w, abs(H1));
% title('Bien do H1');
% xlabel('w [rad/s]');
% ylabel('H1');
% grid on;
% 
% subplot(1,2,2)
% plot(w, angle(H1));
% title('Pha H1');
% xlabel('w [rad/s]');
% ylabel('Pha');
% grid on;
% 
% %Do thi bien do va pha H2
% figure
% subplot(1,2,1)
% plot(w, abs(H2));
% title('Bien do H2');
% xlabel('w [rad/s]');
% ylabel('H2');
% grid on;
% 
% subplot(1,2,2)
% plot(w, angle(H2));
% title('Pha H2');
% xlabel('w [rad/s]');
% ylabel('Pha');
% grid on;

%Bai 15
% V? hàm x^2 + y^2 trong d?i 
% x = (-2:0.2:2);
% 
% y = (-1:0.1:1)';
% 
% v = ones(length(x),1);
% u = ones(length(y),1);
% 
% X = v*x;
% Y = y*u';
% 
% z = X.^2 + Y.^2;
% 
% mesh(x, y, z);
% grid on

%Bai 16:

%Cach 1
% [x,y,z] = sphere(1000);
% x = x*3;
% y = y*3;
% z = z*3;
% figure
% mesh(x,y,z)
% axis equal;
% grid on;

%Cach 2

r = 3;
[u,v]=meshgrid(linspace(0,2*pi,1000), linspace(0,pi,1000));

x = r.*cos(u).*sin(v);
y = r.*sin(u).*sin(v);
z = r.*cos(v);
figure
mesh(x,y,z);
axis equal;
grid on;













