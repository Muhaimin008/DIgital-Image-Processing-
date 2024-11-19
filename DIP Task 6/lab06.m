clc;clear all;close all;

i = imread('two_cats.jpg');
hsv = rgb2hsv(i);
h = hsv(:,:,1);
s = hsv(:,:,2);
gray = rgb2gray(i);
[Gx,Gy] = imgradientxy(gray);
figure(1);
imshow(Gx);
figure(2);
imshow(Gy);
out = Gx + Gy;
figure(3);
imshow(out);