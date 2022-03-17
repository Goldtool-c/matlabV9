function f = sumDisp(X)
sum = 0;
dispX = var(X);
Size = size(dispX);
for i = 1:Size(2)
    sum = sum + dispX(i);
end
f = sum;
