close all;
clear all;
clc;

i = imread('Fig0310(a)(Moon Phobos).tif.jpg');

figure(1);
subplot(211), imshow(i), title('original');
subplot(212), imhist(i), title('histogram');

figure(2);
j = histeq(i);
subplot(211), imshow(j), title('original');
subplot(212), imhist(j), title('histogram');


figure(3);
mu = [0.15*255; 0.75*255];
A = [1; 0.07];
k1 = 0.002;
k2 = 0.002;
space = [0:1:255];
s = [0.05*255; 0.05*255];
f = A(1)*1 / sqrt(2*pi*s(1))* exp( -(space- mu(1)).^2 / (2*s(1)))+k1;
g = A(2)*1 / sqrt(2*pi*s(2))* exp( -(space- mu(2)).^2 / (2*s(2)))+k2;
h = f+g;
plot(space,h);
