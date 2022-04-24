%% 
t = 1;
t0 = 0.0001;
v = 0.99;
x0 = [5 5];
x = x0;
it = 0;
M = 2;
a = -10; b = 10;
while (t>=t0)
    it = it + 1;
    z = randn(M,1);
    ksi = rand(M,1);
    next = x;
    flag = false;
    for i = 1:M
        next(i) = x(i) + z(i)*t*((1 + it/t)^(2*ksi(i) - 1) - 1);
        if ((a > next(i))||(b < next(i))) 
            flag = true;
        end
    end
    if (flag)
        continue;
    else 
        f = func(x(:,1), x(:,2));
        nextF = func(next(:,1), next(:,2));
        if ((nextF - f) < 0)
            x = next;
        else
            P = exp(-(nextF - f)/t);
            if (rand < P)
                x = next;
            else
                t = v*t;
            end
        end 
    end
end
z = func(x(1), x(2));
disp('Глобальный минимум по симуляции отжига');
disp(x(1));
disp(x(2));
disp(z);
