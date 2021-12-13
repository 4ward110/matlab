% function [t,y,code] = nrzcode(d,R,Ns,type)
% % d – chu?i d? li?u
% % R – t?c ?? d? li?u
% % Ns – t?ng s? m?u bi?u di?n
% % t – vector th?i gian
% % y – vector m?u ??u ra
% % type – ki?u mã (unipolar - 'unipol' or polar - 'pol')
%     Tb = 1/R; % chu kì bit
%     Nb = length(d); % s? l??ng bit
%     Timewindow = Nb*Tb; % c?a s? th?i gian bi?u di?n
%     ts = Timewindow/(Ns-1); %chu kì l?y m?u
%     t = 0:ts:Timewindow; %vector th?i gian
%     y = zeros(size(t));
%     if nargin <= 3
%         type = 'unipol';
%     end
%     for k = 1:Ns %loop qua t?ng m?u bi?u di?n
%         n = fix(t(k)/Tb) + 1;
%         if n >= Nb
%             n = Nb;
%         end
%         switch (type)
%             case 'unipol'
%                 y(k) = d(n);
%             case 'pol'
%                 y(k) = 2*d(n)-1;
%         end
%     end
% end

function [t,y,code] = nrzcode(d,R,Ns,type)
d=round (rand (1,10))
R=50*10^6;
Ns=256;
Tb = 1/R; 
Nb = length(d); 
Timewindow = Nb*Tb;
ts = Timewindow/(Ns-1); 
t = 0:ts:Timewindow; 
y = zeros(size(t));
code = [];
s=1;
for k = 1:Ns
    n = fix(t(k)/Tb)+1;
    if n >= Nb
        n = Nb;
    end
            disp('d(n)=')
             disp(d(n))            

               if d(n)==0
                   d(n)=0;
                   y(k) = d(n);
                   code(n) = d(n);
               else
                  
                   if mod(s,2)==0
                       d(n)=1;
                       y(k) = d(n);
                       code(n) = d(n);
                   else 
                       d(n)=-1
                        y(k) = d(n);
                        code(n) = d(n);
                   end

               end   
end
stairs(t,y,'-r');
axis([1 length(d) min(y)-0.5 max(y)+0.5])
axis([0 inf -2 2]);
grid on;
end


