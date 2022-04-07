clc
close all
clear all
file = fopen('data9.txt', 'r');
X = fscanf(file, '%f', [2 inf])';
fclose(file);
x = X(:,1);
y = X(:,2);
Size = size(X);
scatter(x,y);
hold on;
%% 
m = 4;
clusterCenter = zeros(m, 2);
for i = 1:m
    clusterCenter(i,1) = randi(4)+1;
    clusterCenter(i,2) = randi(7)-1;
end
scatter(clusterCenter(:, 1), clusterCenter(:, 2), 'black');
figure;
k = 1;
kMax = 10000;
h = 0.1;
eps = 0.01;
d = zeros(1, m);
while(true)
    obj = randi(80);
    for i = 1:m
         d(i) = pdist([X(obj,:); clusterCenter(i,:)]);
    end
    [minDist, num] = min(d);
    newCenter = clusterCenter;
    newCenter(num,1) = clusterCenter(num,1)+ h*(x(obj) - clusterCenter(num,1));
    newCenter(num,2) = clusterCenter(num,2)+ h*(y(obj) - clusterCenter(num,2));  
    if (d(num) <= eps) || (k == kMax)
        break
    end
    k = k+1;
    clusterCenter = newCenter;
end
d = zeros(1, m);
U = zeros(Size(1), 2);
for i = 1:Size(1)
    for n = 1:m
    d(n) = pdist([X(i,:); clusterCenter(n,:)]);
    end 
    [minDist, obj] = min(d);
    U(i,1) = obj;
    U(i,2) = minDist;
end
gscatter(x, y, U(:,1));
hold on;
scatter(clusterCenter(:, 1), clusterCenter(:, 2), 'black');
