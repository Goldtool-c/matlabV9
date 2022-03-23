function f = distance(X)
d = pdist(X, 'euclidean');
d = [d; pdist(X, 'cityblock')];
d = [d; pdist(X, "chebychev")];
f=d;