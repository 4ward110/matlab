%bai9
% t=[0:0.1:10];
% s = sin(2*pi*5*t).*cos(2*pi*3*t)+exp(-0.1*t);


%bai 13 semilogyH1


% Bài 13
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

%Bai 14:







