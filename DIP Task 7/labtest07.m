clc;clear all;close all;

%I = vl_impattern('Image1') ;
%image(I) ;
%I = single(rgb2gray(I)) ;
I1 = imread('Image1.jpg');
Ia = im2single(I1);
I = rgb2gray(Ia);
figure;
imshow(I1);
[f,d] = vl_sift(I) ;
perm = randperm(size(f,2)) ;
sel = perm(1:20) ;
h1 = vl_plotframe(f(:,sel)) ;
h2 = vl_plotframe(f(:,sel)) ;
set(h1,'color','k','linewidth',3) ;
set(h2,'color','y','linewidth',2) ;

h3 = vl_plotsiftdescriptor(d(:,sel),f(:,sel)) ;
set(h3,'color','g') ;

%run ('VLFEATROOT/toolbox/vl_setup') 
