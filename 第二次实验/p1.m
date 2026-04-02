f1 = @(x) exp(x) - x.*sin(x);
x1_fzero = fzero(f1, 0);
x1_fsolve = fsolve(f1, 0, optimoptions('fsolve','Display','off'));

p = [1 0 3 0 5 0 7 -9];
r = roots(p);
real_roots = r(imag(r)==0);

f2 = @(x) x.^7 + 3*x.^5 + 5*x.^3 + 7*x - 9;
x2_fzero = fzero(f2, 1);

x2_fsolve = fsolve(f2, 1, optimoptions('fsolve','Display','off'));

x = 1;
for k = 1:20
    f_val = x^7 + 3*x^5 + 5*x^3 + 7*x - 9;
    df_val = 7*x^6 + 15*x^4 + 15*x^2 + 7;
    x = x - f_val/df_val;
end
x2_newton = x;

fprintf(' e^x - x sinx = 0 \n');
fprintf('fzero 解：%.8f\n', x1_fzero);
fprintf('fsolve 解：%.8f\n\n', x1_fsolve);

fprintf(' x^7+3x^5+5x^3+7x-9=0 \n');
fprintf('实根个数：%d\n', length(real_roots));
fprintf('roots 解：%.8f\n', real_roots);
fprintf('fzero 解：%.8f\n', x2_fzero);
fprintf('fsolve 解：%.8f\n', x2_fsolve);
fprintf('牛顿法解：%.8f\n', x2_newton);