expand_point = pi/2;  % 泰勒展开点
x = linspace(0, pi, 1000);  % 绘图区间
y_real = sin(x);  % 真实sin(x)的函数值
t = x - expand_point;  

y_0 = ones(size(x)) * 1;  % 0次展开,奇数次展开为0无需计算
y_2 = 1 - t.^2 / factorial(2);  % 2次展开
y_4 = y_2 + t.^4 / factorial(4);  % 4次展开
y_6 = y_4 - t.^6 / factorial(6);  % 6次展开
y_8 = y_6 + t.^8 / factorial(8);  % 8次展开

figure('Color','white');
hold on;  

plot(x, y_real, 'k-', 'LineWidth', 3, 'DisplayName', '真实函数 y=sin(x)');
plot(x, y_0, 'c--', 'LineWidth', 2, 'DisplayName', '0次泰勒展开');
plot(x, y_2, 'g--', 'LineWidth', 2, 'DisplayName', '2次泰勒展开');
plot(x, y_4, 'b--', 'LineWidth', 2, 'DisplayName', '4次泰勒展开');
plot(x, y_6, 'm--', 'LineWidth', 2, 'DisplayName', '6次泰勒展开');
plot(x, y_8, 'r--', 'LineWidth', 2, 'DisplayName', '8次泰勒展开');
scatter(expand_point, sin(expand_point), 80, 'k', 'filled', 'DisplayName', '展开点 x=π/2');

hold off;  

xlabel('x');
ylabel('y');
title('y=sin(x)在x=π/2处的各阶泰勒展开对比');
legend('Location','best');  
grid on;
xlim([0, pi]);
ylim([-0.2, 1.2]);