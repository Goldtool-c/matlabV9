function R = weightedResiduals(func, y, sigma, Size)
R = zeros(Size);
for i = 1:Size
    R(i) = (y(i)-func(i))/sigma(i);
end