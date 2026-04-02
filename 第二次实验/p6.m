M_d = 60000;    % 火箭干质量（kg）
M_f = 510000;   % 燃料初始质量（kg）
m = 1500;       % 单位时间喷射燃料质量（kg/s）
v_e = 4000;     % 喷射速度（m/s）
k = 0.2;        % 阻力系数（1/s）
g = 9.8;        % 重力加速度（m/s^2）
t_burn = M_f/m; % 燃料燃烧时间（s）

ode = @(t, v) (m*v_e)/(M_d + M_f - m*t) - k*v - g;

%求解微分方程
tspan = [0, t_burn];
v0 = 0;  
[t, v] = ode45(ode, tspan, v0);

s = cumtrapz(t, v);

figure('Color','w');
subplot(2,1,1);
plot(t, v, 'r-', 'LineWidth',1.5);
xlabel('时间 t (s)');
ylabel('速度 v (m/s)');
title('火箭速度随时间变化');
grid on;

subplot(2,1,2);
plot(t, s, 'b-', 'LineWidth',1.5);
xlabel('时间 t (s)');
ylabel('位移 s (m)');
title('火箭位移随时间变化');
grid on;

fprintf('燃料燃烧时间：%.2f s\n', t_burn);
fprintf('燃烧结束时速度：%.2f m/s\n', v(end));
fprintf('燃烧结束时位移：%.2f m\n', s(end));