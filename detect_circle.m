%% 检测出圆形物体
%功能：检测圆形物体
%输入：读入检测的图像；修改近似为圆形的度量值(0,1)之间
%输出：标记图像中圆形物体
%
%讨论：欢迎加入研究生图像处理QQ群：283461032
%
%% 第一步，图像二值化
%读取图像
function detect_circle(I_gray)

% figure,imshow(I_rgb);
% 
% 真彩图转化为灰度图
% I_gray=rgb2gray(I_rgb);
%  figure,imshow(I_gray);
%
%灰度图转化为二值图像,需要注意的是二值化阈值大小在[0,1]之间
%本文阈值level可以用Otsu方法获取，全局阈值。采用函数graythresh
level=graythresh(I_gray);
I_bw=im2bw(I_gray,level);
% figure,imshow(I_bw);
%% 第二步，找到物体边界。关键点是：图像“缝隙”和“孔洞”的概念和填补方法
%去掉小目标，像素数小于30的，关键点理解图像连通域的含义。
%这个30根据具体应用中目标的大小调节
bw1=bwareaopen(I_bw,30);
% figure,imshow(bw1);
%二值图像去除小区域后，对大区域中的缝隙填充，同时平滑边界
%膨胀腐蚀所用圆单元，需要注意参数3需要调试，以满足不同场合应用。
se=strel('disk',3);
bw2=imclose(bw1,se);
% figure,imshow(bw2);
%在上一步先腐蚀膨胀之后，对连通域填孔，使其变为实心体。
bw3=imfill(bw2,'holes');
% figure,imshow(bw3);
%显示图像的边界,B是边界像素位置，cell组。L是标记矩阵，标识图像中目标个数
%L_bw对不同目标显示不同颜色，目标边界白色显示
[B,L]=bwboundaries(bw3,'noholes');
L_bw=label2rgb(L,@jet,[.5,.5,.5]);
figure,imshow(L_bw);
hold on
for k=1:length(B)
    B_object=B{k};
    plot(B_object(:,2),B_object(:,1),'w','Linewidth',2);%白色显示边界
end
%% 第三步，找出圆形目标
%求出标记矩阵L中，各个区域的面积和质心
property=regionprops(L,'Area','Centroid');
%判断图像中每个目标是否近似为圆形
for k2=1:length(B);
    B_object2=B{k2};
    delta=diff(B_object2).^2;
    %周长
    perimeter=sum(sqrt(sum(delta,2)));
    %面积
    area=property(k2).Area;
    area_str=sprintf('%2.2f',area);
    %近似为圆形度量值test，越接近1标识越近似圆
    test=(4*pi*area)/(perimeter^2);
    test_str=sprintf('%2.2f',test);
    
    if test>100  %重要！假若度量值大于0.9，就认为是圆形，加入这条if只显示满足条件的圆形
       
       %标记圆心       
       centroid=property(k2).Centroid;
       plot(centroid(1),centroid(2),'*','Color','k');
       %数值显示
       text(B_object2(1,2)-85,B_object2(1,1)+13,strcat('近似比:',test_str));
       text(B_object2(1,2)-85,B_object2(1,1)-3,strcat('面积:',area_str));
    end
end
title('大于度量值0.9可以认为是圆形，该度量值可以自由设定');