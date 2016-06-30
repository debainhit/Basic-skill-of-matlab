%% ����Բ������
%���ܣ����Բ������
%���룺�������ͼ���޸Ľ���ΪԲ�εĶ���ֵ(0,1)֮��
%��������ͼ����Բ������
%
%���ۣ���ӭ�����о���ͼ����QQȺ��283461032
%
%% ��һ����ͼ���ֵ��
%��ȡͼ��
function detect_circle(I_gray)

% figure,imshow(I_rgb);
% 
% ���ͼת��Ϊ�Ҷ�ͼ
% I_gray=rgb2gray(I_rgb);
%  figure,imshow(I_gray);
%
%�Ҷ�ͼת��Ϊ��ֵͼ��,��Ҫע����Ƕ�ֵ����ֵ��С��[0,1]֮��
%������ֵlevel������Otsu������ȡ��ȫ����ֵ�����ú���graythresh
level=graythresh(I_gray);
I_bw=im2bw(I_gray,level);
% figure,imshow(I_bw);
%% �ڶ������ҵ�����߽硣�ؼ����ǣ�ͼ�񡰷�϶���͡��׶����ĸ���������
%ȥ��СĿ�꣬������С��30�ģ��ؼ������ͼ����ͨ��ĺ��塣
%���30���ݾ���Ӧ����Ŀ��Ĵ�С����
bw1=bwareaopen(I_bw,30);
% figure,imshow(bw1);
%��ֵͼ��ȥ��С����󣬶Դ������еķ�϶��䣬ͬʱƽ���߽�
%���͸�ʴ����Բ��Ԫ����Ҫע�����3��Ҫ���ԣ������㲻ͬ����Ӧ�á�
se=strel('disk',3);
bw2=imclose(bw1,se);
% figure,imshow(bw2);
%����һ���ȸ�ʴ����֮�󣬶���ͨ����ף�ʹ���Ϊʵ���塣
bw3=imfill(bw2,'holes');
% figure,imshow(bw3);
%��ʾͼ��ı߽�,B�Ǳ߽�����λ�ã�cell�顣L�Ǳ�Ǿ��󣬱�ʶͼ����Ŀ�����
%L_bw�Բ�ͬĿ����ʾ��ͬ��ɫ��Ŀ��߽��ɫ��ʾ
[B,L]=bwboundaries(bw3,'noholes');
L_bw=label2rgb(L,@jet,[.5,.5,.5]);
figure,imshow(L_bw);
hold on
for k=1:length(B)
    B_object=B{k};
    plot(B_object(:,2),B_object(:,1),'w','Linewidth',2);%��ɫ��ʾ�߽�
end
%% ���������ҳ�Բ��Ŀ��
%�����Ǿ���L�У�������������������
property=regionprops(L,'Area','Centroid');
%�ж�ͼ����ÿ��Ŀ���Ƿ����ΪԲ��
for k2=1:length(B);
    B_object2=B{k2};
    delta=diff(B_object2).^2;
    %�ܳ�
    perimeter=sum(sqrt(sum(delta,2)));
    %���
    area=property(k2).Area;
    area_str=sprintf('%2.2f',area);
    %����ΪԲ�ζ���ֵtest��Խ�ӽ�1��ʶԽ����Բ
    test=(4*pi*area)/(perimeter^2);
    test_str=sprintf('%2.2f',test);
    
    if test>100  %��Ҫ����������ֵ����0.9������Ϊ��Բ�Σ���������ifֻ��ʾ����������Բ��
       
       %���Բ��       
       centroid=property(k2).Centroid;
       plot(centroid(1),centroid(2),'*','Color','k');
       %��ֵ��ʾ
       text(B_object2(1,2)-85,B_object2(1,1)+13,strcat('���Ʊ�:',test_str));
       text(B_object2(1,2)-85,B_object2(1,1)-3,strcat('���:',area_str));
    end
end
title('���ڶ���ֵ0.9������Ϊ��Բ�Σ��ö���ֵ���������趨');