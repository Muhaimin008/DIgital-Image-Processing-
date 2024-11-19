clc;clear all;close all;

i = imread('two_cats.jpg');
g = rgb2gray(i);
%gx = edge(g,'sobel');
h = fspecial('sobel');
t = transpose(h);
horizon = imfilter(g,h,'replicate');
vertical = imfilter(g,t,'replicate');
comb = horizon+vertical;
subplot(131),imshow(horizon),title('horizontal edge');
subplot(132),imshow(vertical),title('vertical edge');
subplot(133),imshow(comb),title('combined image');
