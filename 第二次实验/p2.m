n = 1000;
A = rand(n);
x_true = (1:n)';
b = A * x_true;

x_sol = A \ b;

err = norm(x_sol - x_true);
fprintf('n=1000时，解的2-范数误差：%.4e\n', err);

n_list = [100, 200, 500, 800, 1000, 1500, 2000,5000,10000];
time_list = [];
for n = n_list
    A = rand(n);
    x_true = (1:n)';
    b = A * x_true;
    
    tic;
    x_sol = A \ b;
    t = toc;
    
    time_list = [time_list, t];
    fprintf('n=%d，求解时间：%.4f s\n', n, t);
end

figure;
plot(n_list, time_list, 'bo-', 'LineWidth',1.5);
xlabel('矩阵阶数 n');
ylabel('求解时间 (s)');
title('求解时间与问题规模 n 的关系');
grid on;
