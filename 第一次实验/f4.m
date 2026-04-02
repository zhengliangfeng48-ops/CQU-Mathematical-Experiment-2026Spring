year = 1997:2024;  
cpi = [103.1, 96.4, 99.3, 96.7, 101.7, 99.6, 100.6, 103.7,...
       100.8, 102.4, 104.7, 105.6, 98.4, 103.2, 105.3, 102.6,...
       102.7, 101.8, 101.3, 101.8, 101.0, 102.0, 102.7, 102.3,...
       100.3, 102.1, 99.7, 100.2];

cpi_max = max(cpi);          % 最大值
cpi_min = min(cpi);          % 最小值
cpi_mean = mean(cpi);        % 平均值
cpi_std = std(cpi);          % 标准差
cpi_median = median(cpi);    % 中位数

fprintf('CPI最大值：%.2f（年份：%d）\n', cpi_max, year(cpi == cpi_max));
fprintf('CPI最小值：%.2f（年份：%d）\n', cpi_min, year(cpi == cpi_min));
fprintf('CPI平均值：%.2f\n', cpi_mean);
fprintf('CPI中位数：%.2f\n', cpi_median);
fprintf('CPI标准差：%.2f\n', cpi_std);

figure('Color','white');
plot(year, cpi, 'b-o', 'LineWidth', 1.5, 'MarkerSize', 4);
hold on;
yline(100, 'r--', 'LineWidth', 1.5, 'DisplayName', '通胀/通缩临界线（100）');
xlabel('年份');
ylabel('CPI指数（上年=100）');
title('重庆1997年（直辖）-2024年年度CPI走势图');
legend('重庆年度CPI', 'Location','best');
grid on;
set(gca, 'XTick', 1997:2:2024);  
