
%-------------------------------------------------------------------------
% ------读取指定目录下固定格式的文件------
% strname = dir('path\*.#')------
% para:
%       path:需要获取的文件夹路径
%       *:通配符
%       #:文件类型
%       类似于正则匹配
%-------------------------------------------------------------------------
dir_path = 'E:\原桌面\质量较差的\';%不要忘记最后的\
full_path =  'E:\原桌面\质量较差的\*.bmp' ;
%----------
% 无法直接读取，原因是matlab中struct结构
% imgfiles_rep1 = 
%      0x1 struct array with fields:
%      name
%      date
%      bytes
%      isdir
%      datenum
%----------

%方式1：存在数组矩阵中
imgfiles_rep1 = dir([dir_path,'*.bmp']);
n = length(imgfiles_rep1);
imset = [];
for i =1:n
   imname = strcat(dir_path,imgfiles_rep1(i,1).name);
   imset = [imset;imname];
end

%方式2：存在元胞中
imgfiles_rep2 = dir(full_path);
data =  cell(n,1);
for k = 1:n
    filename = [dir_path,imgfiles_rep2(k).name];
    data{k} = filename;
end

%-------------------
%总结：相对而言还是用路径的方式比较通用
%-------------------

% fid = fopen(path,'r');
% z= fgetl(fid)
% A = sscanf(z,'%*s %d %d %d',[1 3]); %* 忽略前面的字符 按照固定格式
% fclose(fid);