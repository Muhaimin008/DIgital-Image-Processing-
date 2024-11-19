clc;clear all;close all;

%I1 = vl_impattern('roofs1') ;
%Ia = single(rgb2gray(I1)) ;
%I2 = vl_impattern('roofs3') ;
%Ib = single(rgb2gray(I2)) ;
I1 = imread('roofs1.jpg');
%I1(336:340,293:509,:)=0;
Ix = im2single(I1);
Ia = rgb2gray(Ix);

I2 = imread('roofs3.jpg');
I2(201:256,229:320,:)=0;
Iy = im2single(I2);
Ib = rgb2gray(Iy);

[fa, da] = vl_sift(Ia) ;
[fb, db] = vl_sift(Ib) ;
[matches, scores] = vl_ubcmatch(da, db) ;


numBestPoints = 10;
[~,indices] = sort(scores);

%// Get the numBestPoints best matched features
bestMatches = matches(:,indices(1:numBestPoints));


%// Spawn a new figure and show the two images side by side
figure;
imagesc(cat(2, I1, I2));

%// Extract the (x,y) co-ordinates of each best matched feature
xa = fa(1,bestMatches(1,:));

%// CAUTION - Note that we offset the x co-ordinates of the
%// second image by the width of the first image, as the second
%// image is now beside the first image.
xb = fb(1,bestMatches(2,:)) + size(Ia,2);
ya = fa(2,bestMatches(1,:));
yb = fb(2,bestMatches(2,:));

%// Draw lines between each feature
hold on;
h = line([xa; xb], [ya; yb]);
set(h,'linewidth', 1, 'color', 'b');

%// Use VL_FEAT method to show the actual features
%// themselves on top of the lines
vl_plotframe(fa(:,bestMatches(1,:)));
fb2 = fb; %// Make a copy so we don't mutate the original
fb2(1,:) = fb2(1,:) + size(Ia,2); %// Remember to offset like we did before
vl_plotframe(fb2(:,bestMatches(2,:)));
axis image off; %// Take out the axes for better display




