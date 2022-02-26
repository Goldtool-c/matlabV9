function f = normal(params, x)
m = params(1);
si = params(2);
f = (1/(si*((2*3.14).^0.5)))*exp(((x-m).^2)/(-(si*si*2)));