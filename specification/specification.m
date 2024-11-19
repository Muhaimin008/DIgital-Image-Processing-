clc;clear all;close all;
img1 = imread('Moon.tif');

subplot(2,2,1),imshow(img1),title('original Image');
J = histeq(img1);
subplot(2,2,2),imshow(J),title('Equalization');

sig = 0.05;
mu1 = 0.15;
mu2 = 0.75;
space =[0:1:255]; 
F = (1/sqrt(2*pi))*(exp(-.5*(space-mu1/sig).^2)+0.02 +  .7*exp(-.5*(space-mu2/sig).^2))+.002;
subplot(2,2,3),plot(space,F),title('Bimodal Distribution');

com = histeq(img1,F);
subplot(2,2,4),imshow(com),title('Output');