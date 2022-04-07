clc
close all
clear all
file = fopen('data9.txt');
X = fscanf(file, '%f', [2 inf])';
fclose(file);
x = X(:,1);
y = X(:,2);
scatter(x, y);
title('Исходные данные');
hold on;
%% Q3 Минковского р=4
k=4;
Size = size(X);
clusterCenter = zeros(k, Size(2));
%for i = 1:k
%clusterCenter(i, :) = X(i, :);
%end
clusterCenter(1, :) = X(randi(80), :);
clusterCenter(2, :) = X(randi(80), :);
clusterCenter(3, :) = X(randi(80), :);
clusterCenter(4, :) = X(randi(80), :);
scatter(clusterCenter(:, 1), clusterCenter(:, 2));
figure;
U = zeros(Size(1), 2);
prevQ = 1000;
eps = 0.0001;
iter=1;
radius = zeros(1, k);
%% 
while(true)
temp = zeros(1, k);
    for i = 1:Size(1)
        for n = 1:k
        temp(n) = pdist([X(i,:); clusterCenter(n,:)], 'minkowski', 4);
        end
        [minDist, n] = min(temp);
        U(i,1) = n;
        U(i,2) = minDist;
    end
clustQ = 0;
totalClustQ = 0;
    for j = 1:k
        currentCluster = find(U(:,1)==j);
        num = length(currentCluster);
        dist = zeros(1, num);
        clustJ = zeros(num,2);
        for i = 1:num 
            dist(i) = U(currentCluster(i), 2);
            clustJ(i,:) = X(currentCluster(i),:); 
        end
        dispBetPoints = pdist(clustJ, 'minkowski', 4);
        clustQ = sum(dispBetPoints);
        radius(j) = max(dist);
        totalClustQ = totalClustQ + clustQ;
    end
    if (abs(totalClustQ - prevQ)) <= eps
        break;
    else
        for it = 1:k 
             Obj = find(U(:,1)==it);
             num1 = length(Obj);
             for j = 1:Size(2)
                cordSum = 0;
                for i = 1:num1 
                    cordSum = cordSum + X(Obj(i), j);
                end
                clusterCenter(it,j) = cordSum/num1;
             end
        end
        prevQ = totalClustQ;
        iter = iter + 1;
    end
end
gscatter(x, y, U(:,1));
hold on;
scatter(clusterCenter(:, 1), clusterCenter(:, 2));
viscircles(clusterCenter, radius, 'LineWidth', 0.5, 'Color', 'black','EnhanceVisibility', false);
