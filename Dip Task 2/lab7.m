clc;clear all;close all;

I = imread('c_board.png');
Ig = rgb2gray(I);
corners = detectHarrisFeatures(Ig);
imshow(I),hold on;
si = selectStrongest(corners,length(corners));
plot(si.Location(:,1),si.Location(:,2),'g.','Markersize',20);

%run ('VLFEATROOT/toolbox/vl_setup') 