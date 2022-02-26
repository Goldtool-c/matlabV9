function f = hi(func, y, sigma, Size)
f=0;
for i = 1:Size
    f = f + (((func(i)-y(i))/(sigma(i))).^2);
end