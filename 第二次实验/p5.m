%L=(x1+x2)^2+(2x1+x4)^2+(x3+2x2)^2
%  +(x2-x4)^2+λ1(x1+x2+x3+x4)+λ2((x1)^2+(x2)^2+(x3)^2+(x4)^2)
F = @(x) [
    % ∂L/∂x1 = 0
    2*(x(1)+x(2)) + 2*(2*x(1)+x(4)) + x(5) + 2*x(6)*x(1);
    % ∂L/∂x2 = 0
    2*(x(1)+x(2)) + 2*(x(3)+2*x(2)) + 2*(x(2)-x(4)) + x(5) + 2*x(6)*x(2);
    % ∂L/∂x3 = 0
    2*(x(3)+2*x(2)) + x(5) + 2*x(6)*x(3);
    % ∂L/∂x4 = 0
    4*(2*x(1)+x(4)) - 2*(x(2)-x(4)) + x(5) + 2*x(6)*x(4);
    % x1+x2+x3+x4-1=0
    x(1)+x(2)+x(3)+x(4)-1;
    % x1²+x2²+x3²+x4²-1=0
    x(1)^2+x(2)^2+x(3)^2+x(4)^2-1;
];

x0 = [0.25, 0.25, 0.25, 0.25, 0, 0];
options = optimoptions('fsolve','Display','off');
sol = fsolve(F, x0, options);
x1 = sol(1); x2 = sol(2); x3 = sol(3); x4 = sol(4);
lam1 = sol(5); lam2 = sol(6);
minans= (x1+x2)^2+(2*x1+x4)^2+(x3+2*x2)^2+(x2-x4)^2;
fprintf('x1 = %.6f\n', x1);
fprintf('x2 = %.6f\n', x2);
fprintf('x3 = %.6f\n', x3);
fprintf('x4 = %.6f\n', x4);
fprintf('λ1 = %.6f\n', lam1);
fprintf('λ2 = %.6f\n', lam2);
fprintf('min (x1+x2)^2+(2*x1+x4)^2+(x3+2*x2)^2+(x2-x4)^2=%.6f',minans);

