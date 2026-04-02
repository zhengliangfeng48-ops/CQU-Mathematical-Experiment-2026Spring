x = [5.764, 6.286, 6.759, 7.168, 7.408]';
y = [0.648, 1.202, 1.823, 2.526, 3.360]';

%非线性最小二乘拟合椭圆
fun = @(p) ellipse_residual(p, x, y);

%初值
x0_init = mean(x);
y0_init = mean(y);
a_init = 1;
b_init = 0.5;
theta_init = 0;

p0 = [x0_init, y0_init, a_init, b_init, theta_init];

options = optimoptions('lsqnonlin','Display','off');
p = lsqnonlin(fun, p0, [], [], options);

x0 = p(1);
y0 = p(2);
a = abs(p(3));
b = abs(p(4));
theta = p(5);

if b > a
    temp = a; a = b; b = temp;
    theta = theta + pi/2;
end

%计算焦点（太阳）
c = sqrt(a^2 - b^2);

R = [cos(theta), -sin(theta);
     sin(theta),  cos(theta)];

focus1 = [x0; y0] + R * [c; 0];
focus2 = [x0; y0] - R * [c; 0];

%椭圆轨迹
t = linspace(0, 2*pi, 500);
ellipse = [a*cos(t); b*sin(t)];
ellipse_rot = R * ellipse;
x_fit = ellipse_rot(1,:) + x0;
y_fit = ellipse_rot(2,:) + y0;
figure; hold on; grid on; axis equal;
plot(x_fit, y_fit, 'b', 'LineWidth', 2);
scatter(x, y, 80, 'r', 'filled');
scatter(x0, y0, 120, 'k', 'filled');
scatter(focus1(1), focus1(2), 120, 'g', 'filled');
scatter(focus2(1), focus2(2), 120, 'g', 'filled');
legend('拟合椭圆轨道', '观测点', '椭圆中心', '焦点');
title('小行星轨道拟合');
xlabel('x'); ylabel('y');
hold off;

fprintf ('\n 拟合结果 \n');
fprintf('椭圆中心: (%.4f, %.4f)\n', x0, y0);
fprintf('长半轴 a: %.4f\n', a);
fprintf('短半轴 b: %.4f\n', b);
fprintf('旋转角 theta: %.4f rad\n', theta);
fprintf('\n焦点1: (%.4f, %.4f)\n', focus1(1), focus1(2));
fprintf('焦点2: (%.4f, %.4f)\n', focus2(1), focus2(2));


N = 100;
t = linspace(0, 2*pi, N);

%理想椭圆
ellipse_true = [a*cos(t); b*sin(t)];
ellipse_true_rot = R * ellipse_true;

x_true = ellipse_true_rot(1,:)' + x0;
y_true = ellipse_true_rot(2,:)' + y0;

%高斯噪声
sigma = 0.05;
x_noisy = x_true + sigma * randn(size(x_true));
y_noisy = y_true + sigma * randn(size(y_true));

%用带误差数据重新拟合椭圆
fun2 = @(p) ellipse_residual(p, x_noisy, y_noisy);

p0_2 = [x0, y0, a, b, theta];

options = optimoptions('lsqnonlin','Display','off');
p2 = lsqnonlin(fun2, p0_2, [], [], options);

x02 = p2(1);
y02 = p2(2);
a2 = abs(p2(3));
b2 = abs(p2(4));
theta2 = p2(5);

if b2 > a2
    temp = a2; a2 = b2; b2 = temp;
    theta2 = theta2 + pi/2;
end

%误差分析）
center_error = sqrt((x02 - x0)^2 + (y02 - y0)^2);
a_error = abs(a2 - a);
b_error = abs(b2 - b);
theta_error = abs(theta2 - theta);

fprintf('\n\n\n\n\n\n\n\n\n\n\n\n\n\n 均匀采样误差分析 \n');
fprintf('中心误差: %.6f\n', center_error);
fprintf('长轴误差: %.6f\n', a_error);
fprintf('短轴误差: %.6f\n', b_error);
fprintf('角度误差: %.6f rad\n', theta_error);

t_plot = linspace(0, 2*pi, 500);

%原始椭圆
ellipse1 = [a*cos(t_plot); b*sin(t_plot)];
ellipse1_rot = R * ellipse1;
x_fit1 = ellipse1_rot(1,:) + x0;
y_fit1 = ellipse1_rot(2,:) + y0;

%带误差拟合椭圆
R2 = [cos(theta2), -sin(theta2);
      sin(theta2),  cos(theta2)];

ellipse2 = [a2*cos(t_plot); b2*sin(t_plot)];
ellipse2_rot = R2 * ellipse2;
x_fit2 = ellipse2_rot(1,:) + x02;
y_fit2 = ellipse2_rot(2,:) + y02;

figure; hold on; grid on; axis equal;

plot(x_fit1, y_fit1, 'b', 'LineWidth', 2);
plot(x_fit2, y_fit2, 'r--', 'LineWidth', 2);
scatter(x_noisy, y_noisy, 15, 'k', 'filled');

legend('原始轨道', '带误差拟合轨道', '带噪声数据');

title('误差对椭圆轨道拟合的影响');
xlabel('x'); ylabel('y');

hold off;

%数据分布影响(偏采样)
t_bias = linspace(0, pi/2, N);

ellipse_bias = [a*cos(t_bias); b*sin(t_bias)];
ellipse_bias_rot = R * ellipse_bias;

x_bias = ellipse_bias_rot(1,:)' + x0 + sigma*randn(N,1);
y_bias = ellipse_bias_rot(2,:)' + y0 + sigma*randn(N,1);

% 再拟合
fun3 = @(p) ellipse_residual(p, x_bias, y_bias);
p3 = lsqnonlin(fun3, p0_2, [], [], options);

x03 = p3(1); y03 = p3(2);
a3 = abs(p3(3)); b3 = abs(p3(4));
theta3 = p3(5);

fprintf('\n 非均匀采样影响 \n');
fprintf('中心误差: %.6f\n', sqrt((x03-x0)^2 + (y03-y0)^2));
fprintf('长轴误差: %.6f\n', abs(a3-a));
fprintf('短轴误差: %.6f\n', abs(b3-b));


%残差函数
function r = ellipse_residual(p, x, y)
x0 = p(1); y0 = p(2);
a = p(3); b = p(4);
theta = p(5);
R = [cos(theta), -sin(theta);
     sin(theta),  cos(theta)];
xy = [x - x0, y - y0]';
xy_rot = R' * xy;
xr = xy_rot(1,:);
yr = xy_rot(2,:);
r = (xr.^2)/(a^2) + (yr.^2)/(b^2) - 1;
r = r';
end