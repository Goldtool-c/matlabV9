clc
close all
clear all
file = fopen('data9.txt');
X = fscanf(file, '%f', [2 inf])';
fclose(file);
x = X(:,1);
y = X(:,2);
Size = size(X);
scatter(x, y, 35);
title("Исходные данные");
figure;
% b – дальнего соседа, d – центроидный, e – медианной связи.
% 1 – Евклидово, 3 – города, 6 –Чебышева.
%% Расстояния
d = distance(X);
%% Кластерный анализ
clasAn_1b = linkage(d(1, :), 'complete');
clasAn_1d = linkage(d(1, :), 'centroid');
clasAn_1e = linkage(d(1, :), 'median');
clasAn_3b = linkage(d(2, :), 'complete');
clasAn_3d = linkage(d(2, :), 'centroid');
clasAn_3e = linkage(d(2, :), 'median');
clasAn_6b = linkage(d(3, :), 'complete');
clasAn_6d = linkage(d(3, :), 'centroid');
clasAn_6e = linkage(d(3, :), 'median');
%% анализ качества кластеризации с помощью вычисления кофенетического корреляционного коэффициента
coffCorK = zeros(3);
coffCorK(1, 1) = cophenet(clasAn_1b, d(1, :));
coffCorK(2, 1) = cophenet(clasAn_1d, d(1, :));
coffCorK(3, 1) = cophenet(clasAn_1e, d(1, :));
coffCorK(1, 2) = cophenet(clasAn_3b, d(2, :));
coffCorK(2, 2) = cophenet(clasAn_3d, d(2, :));%
coffCorK(3, 2) = cophenet(clasAn_3e, d(2, :));
coffCorK(1, 3) = cophenet(clasAn_6b, d(3, :));%
coffCorK(2, 3) = cophenet(clasAn_6d, d(3, :));
coffCorK(3, 3) = cophenet(clasAn_6e, d(3, :));
disp("Таблица кофенетических коэффициентов")
disp(coffCorK);
disp('_____________');
disp("Лучшим является центроидный метод в сочетании с метрикой города");
disp("Худшим является метод дальнего соседа в сочетании с расстоянием Чебышева");
disp("______________");
dendrogram(clasAn_3d);
title("Центроидный метод в сочетании с метрикой города");
figure;
%%
n = 4;
Cluster = cluster(clasAn_3d, 'maxclust', n);
%% Всякие координаты и расстояния
clusterCenters = zeros(n, Size(2));
clusterRadiuses = zeros(1, n);
clusterDispersions = zeros(1, n);
for i = 1:n
    [clusterCenter, clusterRadius, clusterDispersion] = clusterProps(X,Cluster, Size(2), i);
    clusterRadiuses(i) = clusterRadius;
    clusterDispersions(i) = clusterDispersion;
    clusterCenters(i, :) = clusterCenter;
    disp("___________________________");
    disp("Параметры кластера номер "+i);
    disp("Радиус = "+clusterRadius);
    disp("Дисперсия = "+clusterDispersion);
    disp("Координаты центра");
    disp(clusterCenter);
    disp("___________________________");
end
clusterCenterDistances = zeros(n);
for i = 1:n
    for j = 1:n
        dx = clusterCenters(i, 1) - clusterCenters(j, 1);
        dy = clusterCenters(i, 2) - clusterCenters(j, 2);
        clusterCenterDistances(i, j) = sqrt(dx^2+dy^2);
    end
end
disp("Расстояния между центрами кластеров");
disp(clusterCenterDistances);
disp("___________________________");
%% Построение
gscatter(x, y, Cluster);
title("Исходные данные с обведенными кластерами");
hold on;
scatter(clusterCenters(:,1), clusterCenters(:,2));
viscircles(clusterCenters, clusterRadiuses, 'LineWidth', 0.5, 'Color', 'g','EnhanceVisibility', false);