function [clusterCenter, clusterRadius,  clusterDispersion] = clusterProps(X, Cluster, cols, k)
point = find(Cluster == k);
amountOfPoints = length(point);
cords = zeros(amountOfPoints, cols);
clusterCenter = zeros(1, cols);
clusterCenterDistance = zeros(amountOfPoints, 1);
for i = 1:amountOfPoints
    cords(i,:) = X(point(i),:);
    clusterCenter = clusterCenter + cords(i,:);
end
clusterCenter = clusterCenter/amountOfPoints;
clusterDispersion = 0;
for i = 1:amountOfPoints
    for l = 1:cols
        clusterCenterDistance(i) = clusterCenterDistance(i) + (cords(i,l) - clusterCenter(l))^2;
    end
    clusterDispersion = clusterDispersion + clusterCenterDistance(i);
    clusterCenterDistance(i) = sqrt(clusterCenterDistance(i));
end
clusterDispersion = clusterDispersion/amountOfPoints;
clusterRadius = max(clusterCenterDistance);
disp("Расстояния от центра для кластера номер "+k);
disp(clusterCenterDistance);