function f = func(x,y)
summand1 = (x.^2+y.^2)/30;
summand2 = (-cos(x).*(cos(y/(2^0.5))));
f = summand1 + summand2;
end