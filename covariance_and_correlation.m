mysample = fix(rand(10,3)*50) %FIX(X) rounds the elements of X to the nearest integers   towards zero.

temp = mysample-repmat( mean(mysample),10,1 );
result = temp'*temp/ ( size(mysample,1)-1 )

% ����ͻȻ���֣�ԭ��Э������󻹿����������㣬���������������Ļ���
% ��ÿһά�ȼ�ȥ��ά�ȵľ�ֵ��ʹÿһά���ϵľ�ֵΪ0��Ȼ��ֱ�����µĵ������������������ת�ã�Ȼ�����(N-1)���ɡ�
% ��ʵ���ַ���Ҳ����ǰ��Ĺ�ʽ�Ƶ�������ֻ��������������Ǻ�ֱ�ۣ����ڳ���Ĺ�ʽ�Ƶ�ʱ���Ǻܳ��õģ�ͬ������Matlab����ʵ�֣�

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

