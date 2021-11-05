function [t,y,code] = nrzcode(d,R,Ns,type)
    Tb = 1/R;
    Nb = length(d);
    Timewindow = Nb*Tb;
    ts = Timewindow/(Ns-1);
    t = 0:ts:Timewindow;
    y = zeros(size(t));
    code = [];
    if nargin <= 3
        type = 'unipol';
    end
    for k = 1:Ns
        n = fix(t(k)/Tb) + 1;
        if n >= Nb
            n = Nb;
        end
        switch (type)
            case 'unipol'
                y(k) = d(n);
                code(n) = d(n);
            case 'pol'
                y(k) = 2*d(n)-1;
                code(n) = 2*d(n)-1;
        end
    end
end

