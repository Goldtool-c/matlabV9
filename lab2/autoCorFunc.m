function f = autoCorFunc(func, y, sigma, Size)
f = zeros(Size);
sumNum = 0;
sumDen = 0;
R = weightedResiduals(func,y,sigma,Size);
for i = 1:Size
    for j = 1:(Size-i+1)
        sumNum = sumNum + (R(j)*R(j+i-1));
    end
    for j = 1:Size
        sumDen = sumDen + (R(j)*R(j));
    end
    f(i)=((1/(Size-i+1))*sumNum)/((1/Size)*sumDen);
    sumNum = 0;
    sumDen = 0;
end