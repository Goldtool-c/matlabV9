function f = sqrHi(params, x) 
f=(x.^(params/2 - 1)).*exp(-x/2)./(2^(params/2)*gamma(params/2));