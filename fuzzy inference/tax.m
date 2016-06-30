function y =tax(income)
adjusted_income = income - 6000;
y = compute_tax
    function y = compute_tax
        y = 0.28 * adjusted_income;%用的是同一个工作空间，可以调用嵌套中的变量
        
    end
end