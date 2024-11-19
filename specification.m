clc ; close all; clear;
X = 0:255;
n=0.0009;
PDF = 5*normpdf(X, 30, 15) + normpdf(X, 180, 20); % take the combination of two normal distrubtions
PDF = n+PDF/(sum(PDF)-n); % normalise it, i.e. sum equals to one.
% trans=transpose(PDF);
% size(trans)

% length(PDF)


image=imread('G:\dept\4-1\image processing lab\moon.tif');
% length(histog)
histog=imhist(image);
j=histeq(image,PDF);

figure
plot(X, PDF); % the bimodal distribution
title('bimodal distribution');

figure;
subplot(2,2,1);
imshow(image); title('input image');
subplot(2,2,2);
imshow(j); title('output image');
subplot(2,2,3);
plot(histog); title('input histogram');
subplot(2,2,4);
plot(imhist(j)); title('output histogram');
% new=fitdist(histog, trans);
% figure;
% plot(new);
% % size(histog)
