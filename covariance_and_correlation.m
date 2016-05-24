mysample = fix(rand(10,3)*50) %FIX(X) rounds the elements of X to the nearest integers   towards zero.

temp = mysample-repmat( mean(mysample),10,1 );
result = temp'*temp/ ( size(mysample,1)-1 )

% 今天突然发现，原来协方差矩阵还可以这样计算，先让样本矩阵中心化，
% 即每一维度减去该维度的均值，使每一维度上的均值为0，然后直接用新的到的样本矩阵乘上它的转置，然后除以(N-1)即可。
% 其实这种方法也是由前面的公式推导而来，只不过理解起来不是很直观，但在抽象的公式推导时还是很常用的！同样给出Matlab代码实现：

avg_x1 = mean(mysample(:,1))
avg_x2 = mean(mysample(:,2))
avg_x3 = mean(mysample(:,3))

var_x1 = sum(  (mysample(:,1)-avg_x1).*(mysample(:,1)-avg_x1)  )/(length(mysample(:,1))-1)
var_x2 = sum(  (mysample(:,2)-avg_x2).*(mysample(:,2)-avg_x2)  )/(length(mysample(:,2))-1)
var_x3 = sum(  (mysample(:,3)-avg_x3).*(mysample(:,3)-avg_x3)  )/(length(mysample(:,3))-1)

cov_x12 = sum(  (mysample(:,1)-avg_x1).*(mysample(:,2)-avg_x2)  )/(length(mysample(:,1))-1)
cov_x13 = sum(  (mysample(:,1)-avg_x1).*(mysample(:,3)-avg_x3)  )/(length(mysample(:,1))-1)
cov_x23 = sum(  (mysample(:,2)-avg_x2).*(mysample(:,3)-avg_x3)  )/(length(mysample(:,2))-1)

cov(mysample)

