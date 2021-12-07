function [t,y,code] = nrzcode(d,R,Ns,type)
% d – chu?i d? li?u
% R – t?c ?? d? li?u
% Ns – t?ng s? m?u bi?u di?n
% t – vector th?i gian
% y – vector m?u ??u ra
% type – ki?u mã (unipolar - 'unipol' or polar - 'pol')
    Tb = 1/R; % chu kì bit
    Nb = length(d); % s? l??ng bit
    Timewindow = Nb*Tb; % c?a s? th?i gian bi?u di?n
    ts = Timewindow/(Ns-1); %chu kì l?y m?u
    t = 0:ts:Timewindow; %vector th?i gian
    y = zeros(size(t));
    if nargin <= 3
        type = 'unipol';
    end
    for k = 1:Ns %loop qua t?ng m?u bi?u di?n
        n = fix(t(k)/Tb) + 1;
        if n >= Nb
            n = Nb;
        end
        switch (type)
            case 'unipol'
                y(k) = d(n);
            case 'pol'
                y(k) = 2*d(n)-1;
        end
    end
end

