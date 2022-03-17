clear all
file = fopen('data9.txt');
X = fscanf(file, '%d', [8 inf])';
fclose(file);
mathExpX =  mean(X);
stdX = std(X);
sizeX = size(X);
%% Standartization
for i = 1:sizeX(1)
    for j = 1:sizeX(2)
        X(i, j) = (X(i, j) - mathExpX(j))/stdX(j);
    end
end
%% Проверка
covX = (transpose(X)*X)/(sizeX(1)-1);
d = 0;
for i = 1:sizeX(2)
    for j = (i+1):sizeX(2)
        d = d + (covX(i,j))^2;
    end
end
d = d*sizeX(1);
x_kv = chi2inv(0.95, sizeX(2)*(sizeX(2)-1)/2);
disp("d = " + d);
disp("x_kv = " + x_kv);
disp("_________________");
[A, diag] = eig(covX);
Z = X*A;%% проекции
%% 4 
sumZ = sumDisp(Z);
sumX = sumDisp(X);
disp("sumZ = "+sumZ);
disp("sumX = "+sumX);
otnRazbros = var(Z) / sumZ;
covOtnRazbros = cov(Z);
figure;
scatter(Z(:,1),Z(:,2), 35);
title('Диаграмма рассеяния');
xlabel('Z1');
ylabel('Z2');





