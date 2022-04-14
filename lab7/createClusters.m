function [cl1, cl2, cl3, cl4, clLearning1, clLearning2, clLearning3, clLearning4] = createClusters(cluster, PCA_data, Learning_data)
num1 = find(cluster==1);
num2 = find(cluster==2);
num3 = find(cluster==3);
num4 = find(cluster==4);
size1 = length(num1);
size2 = length(num2);
size3 = length(num3);
size4 = length(num4);
cl1 = zeros(size1, 2); cl2 = zeros(size2, 2);
cl3 = zeros(size3, 2); cl4 = zeros(size4, 2);
clLearning1 = zeros(size1, 8); clLearning2 = zeros(size2, 8);
clLearning3 = zeros(size3, 8); clLearning4 = zeros(size4, 8);
for i = 1:size1
        cl1(i,:) = PCA_data(:,num1(i));
        clLearning1(i,:) = Learning_data(:,num1(i));
end 
for i = 1:size2 
        cl2(i,:) = PCA_data(:,num2(i)); 
        clLearning2(i,:) = Learning_data(:,num2(i));
end 
for i = 1:size3 
        cl3(i,:) = PCA_data(:,num3(i)); 
        clLearning3(i,:) = Learning_data(:,num3(i));
end 
for i = 1:size4 
        cl4(i,:) = PCA_data(:,num4(i)); 
        clLearning4(i,:) = Learning_data(:,num4(i));
end 