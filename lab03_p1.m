clc;
clear all;
close all;

I1 = imread('pout_orig.jpg');
greyI1 = rgb2gray( I1(:,:,1:3) );
J1 = histeq(greyI1);

I2 = imread('tire_orig.jpg');
greyI2 = rgb2gray( I2(:,:,1:3) );
J2 = histeq(greyI2);

[J,T] = imhist(greyI1);
pdf = J/sum(J);
figure(1);
plot(pdf);
cdf = cumsum(pdf);
figure(2);
plot(cdf);

figure(3);
subplot(121), imshow(greyI1), title('pout_orig');
subplot(122), imhist(greyI1), title('histogram'),xlabel('num of intensity'),ylabel('num of bins');
figure(4);
subplot(121), imshow(greyI2), title('pout_orig');
subplot(122), imhist(greyI2), title('histogram'),xlabel('num of intensity'),ylabel('num of bins');

[J3,T1] = imhist(greyI2);
pdf1 = J3/sum(J3);
figure(5);
plot(pdf1);
cdf1 = cumsum(pdf1);
figure(6);
plot(cdf);
figure(7);
imhist(J2);