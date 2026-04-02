a = 1; b = 1; c = 5;
F1 = 1;
F1000_target = 2026;
n_max = 1000;

F1000_fun = @(x) get_F1000(x, a, b, c, F1, n_max);

F2_initial_guess = 1;
F2 = fzero(F1000_fun, F2_initial_guess);

F = zeros(1, n_max);
F(1) = F1;
F(2) = F2;
for n = 2:n_max-1
    F(n+1) = (a*F(n-1) + b*F(n))/c;
end

figure('Color','w');
semilogy(1:n_max, F, 'b-', 'LineWidth',1.5);
xlabel('n');
ylabel('log(F_n)');
title(['广义斐波那契数列半对数图 (a=',num2str(a),',b=',num2str(b),',c=',num2str(c),')']);
grid on;

fprintf('参数 a=%d, b=%d, c=%d\n', a, b, c);
fprintf('F2 = %.6f\n', F2);
fprintf('F1000 = %.6f\n', F(1000));

function F1000 = get_F1000(F2, a, b, c, F1, n_max)
    F = zeros(1, n_max);
    F(1) = F1;
    F(2) = F2;
    for n = 2:n_max-1
        F(n+1) = (a*F(n-1) + b*F(n))/c;
    end
    F1000 = F(n_max) - 2026; 
end
