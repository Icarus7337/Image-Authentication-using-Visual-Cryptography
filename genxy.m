function [x, y] = genxy(num)

x = floor(6*rand(1));
y = (num-x);
y = mod(y,6);

%disp(x,y,num);