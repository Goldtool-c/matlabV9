clc
close all
clear all

file = fopen('Learning_data9.txt', 'r');
Learning_data = fscanf(file, '%f', [8 inf]);
fclose(file);
%%
nw = nwInit(Learning_data); 
nw.trainParam.epochs = 100; 
nw = train(nw, Learning_data);
cluster = vec2ind(sim(nw, Learning_data));
%%
file = fopen('PCA_data9.txt', 'r');
PCA_data = fscanf(file, '%f', [2 inf]);
fclose(file);
[cl1, cl2, cl3, cl4, clL1, clL2, clL3, clL4] = createClusters(cluster, PCA_data, Learning_data);
%%
clMean(1,:) = mean(cl1);
clMean(2,:) = mean(cl2);
clMean(3,:) = mean(cl3);
clMean(4,:) = mean(cl4);
figure
gscatter(PCA_data(1,:), PCA_data(2,:),cluster);
hold on
scatter(clMean(:,1), clMean(:,2));
hold off
%clL = [clL1, clL2, clL3, clL4];
clLMean(1,:) = mean(clL1);
clLMean(2,:) = mean(clL2);
clLMean(3,:) = mean(clL3);
clLMean(4,:) = mean(clL4);
figure
hold on
color = ['r', 'g', 'b', 'c'];
for i = 1:4
plot(clLMean(i, :), color(i)); 
end
title('Средние значения признаков');