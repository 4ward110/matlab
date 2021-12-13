% % im = imread('flower.jpg');
% % im = imresize(im, [320 NaN]);
% % im = rgb2gray(im)
% % h = imshow(im)
% % imattributes(h)
% % size(im)
% function PNRZ(h)
% %Line code POLAR NRZ.
% %Author: Diego Orlando Barragán Guerrero
% %For more information, visit: www.matpic.com
% %diegokillemall@yahoo.com
% %Example:
% h=[1 0 0 1 1 0 1 0 1 0];
% %PNRZ(h)
% clf;
% n=1;
% l=length(h);
% h(l+1)=1;
% while n<=length(h)-1;
%     t=n-1:0.001:n;
% if h(n) == 0
%     if h(n+1)==0  
%         y=-(t<n)-(t==n);
%     else
%         y=-(t<n)+(t==n);
%     end
%     d=plot(t,y);grid on;
%     title('Line code POLAR NRZ');
%     set(d,'LineWidth',2.5);
%     hold on;
%     axis([0 length(h)-1 -1.5 1.5]);
%     disp('zero');
% else
%     if h(n+1)==0
%         y=(t<n)-1*(t==n);
%     else
%         y=(t<n)+1*(t==n);
%     end
%     d=plot(t,y);grid on;
%     title('Line code POLAR NRZ');
%     set(d,'LineWidth',2.5);
%     hold on;
%     axis([0 length(h)-1 -1.5 1.5]);
%     disp('one'); 
% end
% n=n+1;
% %pause; 
% end
% [t,x] = nrzcode(d,1e6,2000,'pol'); % Mã hóa d?ng sóng NRZ
% Ts = t(2)-t(1); % Th?i gian l?y m?u
% xp = raisecosflt(x,1.5e6,Ts,0.5); % T?o d?ng xung
% % Truy?n d?n qua kênh AWGN
% SNRdB = 10; % dB
% SNR = 10^(SNRdB/10);
% varn = var(xp)/SNR; % Xác ??nh ph??ng sai nhi?u
% xnoise = addnoise(xp,varn);
% % Hi?n th? k?t qu?
% plot(t,xp,'rx',t,xnoise);grid;
% xlabel('Time (s)');
% ylabel('Amplitude');
% eyediagram(xp,40); % Bi?u di?n bi?u ?? m?t tín hi?u ??u vào
% eyediagram(xnoise,40);

% function [t, y] = RZcode(d, R, type)
% RZ line code
% *Input:
% d: data stream
% R: Bit rate
% type: u - uniporlar RZ, p - polar RZ, b - bipolar RZ (hay ma AMI).
% *Output:
% t: Vector of time
% y: Output stream

d = randint(1,16)
R = 1e6;
type = 'b';
% close all;
Ns = 1000;      % Tong so mau bieu dien
Tb = 1/R;       % Chu ky bit
Nb = length(d); % So luong bit
Tw = Nb*Tb;     % Cua so thoi gian
ts = Tw/(Ns-1); % Chu ky lay mau
t = 0:ts:Tw;    % Vector thoi gian
pw = 1/2;       % Do rong xung

% Sap xep logic theo quy tac ma AMI
c = zeros(size(t));
s = 1;
for i = 1:Nb
    if d(i) == 1
        s = s+1;
        if mod(s,2) == 0
            c(i) = 1;
        else
            c(i) = -1;
        end
    else
        c(i) = 0;
    end
end
c
% Tao ma RZ
y = zeros(size(t));
for k = 1:Ns
    n = fix(t(k)/Tb)+1;
    if n >= Nb
        n = Nb;
    end
    if mod(t(k),Tb) <= pw*Tb
        switch(type)
            case 'u'
                y(k) = d(n);
            case 'p'
                if d(n) == 1;
                    y(k) = 1;
                else
                    y(k) = -1;
                end
            case 'b'
                y(k) = d(n)*c(n);
        end
    else
        y(k) = 0;
    end
end
plot(t,y,'linewidth',3,'color','r');
grid on;
ylim([-1.5 1.5])




