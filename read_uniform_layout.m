
%-------------------------------------------------------------------------
% ------��ȡָ��Ŀ¼�¹̶���ʽ���ļ�------
% strname = dir('path\*.#')------
% para:
%       path:��Ҫ��ȡ���ļ���·��
%       *:ͨ���
%       #:�ļ�����
%       ����������ƥ��
%-------------------------------------------------------------------------
dir_path = 'E:\ԭ����\�����ϲ��\';%��Ҫ��������\
full_path =  'E:\ԭ����\�����ϲ��\*.bmp' ;
%----------
% �޷�ֱ�Ӷ�ȡ��ԭ����matlab��struct�ṹ
% imgfiles_rep1 = 
%      0x1 struct array with fields:
%      name
%      date
%      bytes
%      isdir
%      datenum
%----------

%��ʽ1���������������
imgfiles_rep1 = dir([dir_path,'*.bmp']);
n = length(imgfiles_rep1);
imset = [];
for i =1:n
   imname = strcat(dir_path,imgfiles_rep1(i,1).name);
   imset = [imset;imname];
end

%��ʽ2������Ԫ����
imgfiles_rep2 = dir(full_path);
data =  cell(n,1);
for k = 1:n
    filename = [dir_path,imgfiles_rep2(k).name];
    data{k} = filename;
end

%-------------------
%�ܽ᣺��Զ��Ի�����·���ķ�ʽ�Ƚ�ͨ��
%-------------------

% fid = fopen(path,'r');
% z= fgetl(fid)
% A = sscanf(z,'%*s %d %d %d',[1 3]); %* ����ǰ����ַ� ���չ̶���ʽ
% fclose(fid);