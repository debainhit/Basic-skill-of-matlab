
%-----------读取除了第一列以后的内容----
%只需要第一行，所以这里只对第一行的内容进行读取
%文件内容：
% 000 3 125 10800000 16:11:22 31/08/2012
% MITSIG.000 16 50 0 0 2 18461 0 MARS export
% MITSIG.000 16 50 0 0 4 6902 0 MARS export
% MITSIG.000 16 50 0 0 28 -23421 0 MARS export
%--------------------------------------

fid = fopen(path,'r');
z= fgetl(fid)
A = sscanf(z,'%*s %d %d %d',[1 3]); %* 忽略前面的字符 按照固定格式
fclose(fid);

%又是个正则化的例子