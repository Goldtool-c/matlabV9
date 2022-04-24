clc
close all
clear all
[X Y] = meshgrid(-10:0.25:10, -10:0.25:10);
Z = func(X, Y);
surf(X, Y, Z);
%% 
N = 50000;
M = 2;
ksi = rand(M, N);
a = -10; b = 10;
XY = zeros(M, N);
for i = 1:M
    for j = 1:N
        XY(i,j) = a + (b - a)*ksi(i,j);
    end
end
Z = func(XY(1,:), XY(2,:));
[Min n] = min(Z);
disp('Глобальный минимум');
disp(XY(:, n));
disp(Min);
disp('________________');
simAnnealing