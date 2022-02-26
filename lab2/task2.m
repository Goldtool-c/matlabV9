clc
close all
clear all
fid = fopen('data9.txt');
A = fscanf(fid, '%f', [3 inf])';
fclose(fid);
x = A(:, 1);
y = A(:, 2);
figure; 
plot(x, y);
hold on;
grid on;
title('y(x)')
xlabel('x')
ylabel('y')
%1 нормальное
initial1 = [1 1];
nonLinearRegression1 = nlinfit(x, y, @normal, initial1);
f1 = normal(nonLinearRegression1, x);
%disp("Normal");
%disp(nonLinearRegression1);
plot(x, f1, 'y');
%2 показательное
initial2 = 3;
nonLinearRegression2 = nlinfit(x, y, @exponential, initial2);
f2 = exponential(nonLinearRegression2, x);
%disp("Exponential");
%disp(nonLinearRegression2);
plot(x, f2, 'b');
%3 хи^2
initial3 = 2;
nonLinearRegression3 = nlinfit(x, y, @sqrHi, initial3);
f3 = sqrHi(nonLinearRegression3, x);
%disp('sqrHi');
%disp(nonLinearRegression3);
plot(x, f3, 'r');
%%
Size = size(A);
Size = Size(1);
sigma = A(:, 3);
dof1 = Size - 2 - 1;   %N - число параметров - 1
dof2 = Size - 1 - 1;
dof3 = Size - 1 - 1;
disp(dof1);
disp(dof2);
disp(dof3);
disp("Критерий согласия равен для f1");
disp(hi(f1, y, sigma, Size)/dof1);
disp("___________________________");
disp("Критерий согласия равен для f2");
disp(hi(f2, y, sigma, Size)/dof2);
disp("___________________________");
disp("Критерий согласия равен для f3");
disp(hi(f3, y, sigma, Size)/dof3);
disp("___________________________");
%% взвешенные остатки
figure;
hold on;
grid on;
title('Residuals')
xlabel('x')
ylabel('R')
fwr1=weightedResiduals(f1, y, sigma, Size);
fwr2=weightedResiduals(f2, y, sigma, Size);
fwr3=weightedResiduals(f3, y, sigma, Size);
plot(x, fwr1, "y");
plot(x, fwr2, "b");
plot(x, fwr3, "r");
%% Автокорреляционная функция
figure;
hold on;
grid on;
title('AutoCorrelation')
xlabel('x')
ylabel('A')
fac1=autoCorFunc(f1,y,sigma,Size);
fac2=autoCorFunc(f2,y,sigma,Size);
fac3=autoCorFunc(f3,y,sigma,Size);
plot(x, fac1, "y");
plot(x, fac2, "b");
plot(x, fac3, "r");
%% Доверительные интервалы
[nonLinearRegression1, r1, J1, cov1] = nlinfit(x, y, @normal, initial1);
dovT1 = dov(dof1, nonLinearRegression1, cov1, 2);
dov1 = nlparci(nonLinearRegression1, r1, 'covar', cov1, 'alpha', 0.32);
[nonLinearRegression2, r2, J2, cov2] = nlinfit(x, y, @exponential, initial2);
dovT2 = dov(dof2, nonLinearRegression2, cov2, 1);
dov2 = nlparci(nonLinearRegression2, r2, 'covar', cov2, 'alpha', 0.32);
[nonLinearRegression3, r3, J3, cov3] = nlinfit(x, y, @sqrHi, initial3);
dovT3 = dov(dof3, nonLinearRegression3, cov3, 1);
dov3 = nlparci(nonLinearRegression3, r3, 'covar', cov3, 'alpha', 0.32);
disp("Доверительные промежутки для f1")
disp(dovT1);
disp(dov1);
disp("Доверительные промежутки для f2")
disp(dovT2);
disp(dov2);
disp("Доверительные промежутки для f3")
disp(dovT3);
disp(dov3);




