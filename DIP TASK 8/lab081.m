clc; clear all; close all;

figure(1);
img = imread('input.png');
img2 = im2double(img);

%*********Photographic Negative**********
negate = imcomplement(img);
figure(2);
subplot(121), imshow('a.png'), title('a.png');
subplot(122), imshow(negate), title('negative');


%**********Logarithmic Transform***********
figure(3);
log1=1.4*log(1+img2);
subplot(121), imshow('c.png'), title('c.png');
subplot(122), imshow(log1), title('Logarithmic Transform (c)');
%**********Gamma Transformation************
figure(4);
gamma1=imadjust(img,[],[],0.4);
subplot(121), imshow('b.png'), title('b.png');
subplot(122), imshow(gamma1), title('Gamma Transformation (b)');%input b
