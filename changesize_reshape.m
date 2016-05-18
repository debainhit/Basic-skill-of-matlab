img = imread('CASE1.bmp');
img = rgb2gray(img);
size(img)
new_img = imresize(img,[300,299]);
new_img = imresize(img,1/2);
size(new_img)