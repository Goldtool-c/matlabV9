function f = exponential(params,x)
lambda = params(1);
f = lambda*exp(-lambda*x);