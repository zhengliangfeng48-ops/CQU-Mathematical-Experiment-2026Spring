F1 = @(x) [
    2*x(1) - x(2) - exp(-x(1));
    -x(1) + 2*x(2) - exp(-x(2))
];
x0_1 = [0; 0];
options = optimoptions('fsolve','Display','off');
x1 = fsolve(F1, x0_1, options);

F2 = @(x) [
    x(1)^2 - 5*x(2)^2 + 7*x(3)^2 + 12;
    3*x(1)*x(2) + x(1)*x(3) - 11*x(1);
    2*x(2)*x(3) + 40*x(1)
];
x0_2 = [0; 2; -10];
x2 = fsolve(F2, x0_2, options);

fprintf('(1)\n');
fprintf('x1 = %.6f, x2 = %.6f\n\n', x1(1), x1(2));

fprintf('(2)\n');
fprintf('x1 = %.6f, x2 = %.6f, x3 = %.6f\n', x2(1), x2(2), x2(3));