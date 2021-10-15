x0 = 2;
root = 1.5;

while (x0 - root) > 0.0001
    x0 = root;
    root = (x0^2 + 2)/(2*x0);
end

disp('Square root 2:')
root
    