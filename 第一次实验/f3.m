n_max = 1000;
n = 1:n_max;
p_n = zeros(size(n));

for i = 1:n_max
    p_n(i) = f(i); 
end

figure('Color','white');
plot(n, p_n, 'b-', 'LineWidth', 1.5);
xlabel('自然数 n');
ylabel('第n个素数 p_n');
title('第n个素数函数 y=f(n) 图像');
grid on; 

function y = f(n)
    if n == 1
        y = 2;
        return;
    end
    if n >= 6
        upper_bound = ceil(n * (log(n) + log(log(n))));
    else
        upper_bound = 15; 
    end
    
    is_prime = true(1, upper_bound); 
    is_prime(1) = false; 
    for i = 2:sqrt(upper_bound)
        if is_prime(i)
            is_prime(i*i : i : upper_bound) = false;
        end
    end
    
    prime_list = find(is_prime);
    y = prime_list(n);
end
