rng(0); 

n = 6; % 阶数
A = randi([-666,666], n, n); 
det_A = det(A); % 行列式真实值

fprintf('测试矩阵:\n');
disp(A);
fprintf('矩阵A的行列式真实值：det(A) = %.4f\n\n', det_A);

A_cofactor = zeros(n,n); % 代数余子式矩阵
for i = 1:n
    for j = 1:n
        temp = A;
        temp(i,:) = [];
        temp(:,j) = [];
        M_ij = det(temp);
        A_cofactor(i,j) = (-1)^(i+j) * M_ij;
    end
end

test_row = 2; 
sum_row = sum(A(test_row,:) .* A_cofactor(test_row,:));
fprintf('按行展开验证\n');
fprintf('按第%d行展开计算结果：%.4f\n', test_row, sum_row);
fprintf('与真实值的误差：%.2e\n\n', abs(sum_row - det_A));

test_col = 3; 
sum_col = sum(A(:,test_col) .* A_cofactor(:,test_col));
fprintf('按列展开验证\n');
fprintf('按第%d列展开计算结果：%.4f\n', test_col, sum_col);
fprintf('与真实值的误差：%.2e\n\n', abs(sum_col - det_A));