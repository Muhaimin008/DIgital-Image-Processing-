clc;clear all; close all;

i1 = rgb2gray(imread('tire_orig.jpg'));
j1 = imnoise(i1,'salt & pepper',0.02);
i2 = rgb2gray(imread('pout_orig.jpg'));
j2 = imnoise(i2,'salt & pepper',0.02);
j3 = imnoise(i1,'gaussian',0.01);
j4 = imnoise(i2,'gaussian',0.01);
figure(1);
subplot(221),imshow(j1),title('salt & pepper');
subplot(222),imshow(j2),title('salt & pepper');
subplot(223),imshow(j3),title('gaussian');
subplot(224),imshow(j4),title('gaussian');

%gaussian filter
g1 = imfilter(j4,fspecial('gaussian',[3 3],1),'replicate');
g2 = imfilter(j4,fspecial('gaussian',[5 5],1),'replicate');
g3 = imfilter(j4,fspecial('gaussian',[7 7],1),'replicate');
%median filter
med1 = medfilt2(j4,[3 3]);
med2 = medfilt2(j4,[5 5]);
med3 = medfilt2(j4,[7 7]);
%mean filter
mn1 = imfilter(j4,fspecial('average',[3 3]),'replicate');
mn2 = imfilter(j4,fspecial('average',[5 5]),'replicate');
mn3 = imfilter(j4,fspecial('average',[7 7]),'replicate');

figure(2);

subplot(331),imshow(g1),title('gaussian'),ylabel('3*3');
subplot(332),imshow(mn1),title('mean');
subplot(333),imshow(med1),title('median');
subplot(334),imshow(g2),ylabel('5*5');
subplot(335),imshow(mn2);
subplot(336),imshow(med2);
subplot(337),imshow(g3),ylabel('7*7');
subplot(338),imshow(mn3);
subplot(339),imshow(med3);

