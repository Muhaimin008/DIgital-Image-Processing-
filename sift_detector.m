clear all; clc;
I1 = imread('roofs1.jpg') ;
%imshow(Ia) ;

I2 = imread('roofs2.jpg') ;
%imshow(Ib) ;

Ia = single(rgb2gray(I1));
Ib = single(rgb2gray(I2));

%[f,d] = vl_sift(I) ;

%perm = randperm(size(f,2)) ;
%sel = perm(1:10) ;
%h1 = vl_plotframe(f(:,sel)) ;
%h2 = vl_plotframe(f(:,sel)) ;
%set(h1,'color','k','linewidth',3) ;
%set(h2,'color','y','linewidth',2) ;

%h3 = vl_plotsiftdescriptor(d(:,sel),f(:,sel)) ;
%set(h3,'color','g') ;
[fa, da] = vl_sift(Ia) ;
[fb, db] = vl_sift(Ib) ;
[matches, scores] = vl_ubcmatch(da, db) ;
numBestPoints = 10;
[~,indices] = sort(scores);

bestMatches = matches(:,indices(1:numBestPoints));

xa = fa(1,bestMatches(1,:));

xb = fb(1,bestMatches(2,:)) + size(Ia,2);
ya = fa(2,bestMatches(1,:));
yb = fb(2,bestMatches(2,:));

imshow(I1);
h1 = vl_plotsiftdescriptor(da(:,bestMatches(1,:)),fa(:,bestMatches(1,:))) ;
set(h1,'color','y') ;

%imshow(I2);
%h2 = vl_plotsiftdescriptor(db(:,bestMatches(2,:)), fb2(:,bestMatches(2,:))) ;
%set(h2,'color','y') ;
