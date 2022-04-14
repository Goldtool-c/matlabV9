function f = nwInit(Learning_data)
dim1 = 2;
dim2 = 2; 
Min = min(Learning_data, [], 2);
Max = max(Learning_data, [], 2);
PR = zeros(8, 2);
for i = 1:8
    PR(i, 1) = Min(i);
    PR(i, 2) = Max(i);
end
f = newsom(PR, [dim1 dim2]);
