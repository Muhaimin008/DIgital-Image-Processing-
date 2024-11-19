clear; 
clc;
%%
A = imread('coin.png');
a = rgb2gray(A);
%% 
[row col]=size(a);
ah=uint8(zeros(row,col));
n=row * col;
freq=zeros(256,1);
pdf=zeros(256,1);
cdf=zeros(256,1);
cum=zeros(256,1);
out=zeros(256,1);
%% PDF
for r=1:row
    for c=1:col
        value=a(r,c);   %intensity level of this pixel
        freq(value+1)=freq(value+1)+1;  %increment the number of pixels in this intensity level
        pdf(value+1)=freq(value+1)/n;   %pdf %not necessary if cdf is not calculated directly from pdf
    end
end
%% CDF & Quantization
sum=0;
L=256;
%out = round(L*cumsum(pdf)); % cumsum of pdf is cdf
for i=1:size(pdf)
    sum=sum+freq(i);    %cumulative sum of freqency
    cum(i)=sum; %cumulative sum of freqency
    cdf(i)=cum(i)/n;    %cdf
    q(i)=round(cdf(i)*(L-1)); %quantization
end
%% Reconstruct
for r=1:row
    for c=1:col
        ah(r,c)=q(a(r,c)+1);
    end
end
%% 
%% Output
subplot(6,2,1); imshow(a);
subplot(6,2,2); plot(imhist(a));
subplot(6,2,3); imshow(ah);
subplot(6,2,4); plot(imhist(ah));
%% Histogram Equalization (Built-in function)
subplot(6,2,5)
imshow(histeq(a,255))
subplot(6,2,6)
plot(imhist(histeq(a,255)))

% 
% clear; clc;
% A = imread('coin.png');
% a = rgb2gray(A);
% %% Real Image
% subplot(1,2,1)
% imshow(a)
% subplot(1,2,2)
% plot(imhist(a))
% %% Histogram Equalization (Built-in function)
% subplot(1,2,1)
% imshow(histeq(a,255))
% subplot(1,2,2)
% plot(imhist(histeq(a,255)))
% %% Histogram Equalization (implemented)
% [row col] = size(a);
% in = zeros(1,255);
% out= zeros(1,255);
% for r=1:row
%     for c=1:col
%         in(a(r,c)+1) = in(a(r,c)+1) + 1; 
%     end
% end
% in = in/(row*col);
% out = round(256-1)*cumsum(in);
% stem(out);
% for r=1:row
%     for c=1:col
%         px  = a(r,c);
%         new(r,c) = out(px+1);
%     end
% end
% new = new/255
% 
% subplot(1,2,1)
% imshow(new)
% subplot(1,2,2)
% plot(imhist(new))
% %m = max(max(max(A)))
% %imshow(new)
% %% Comparative Analysis
% %images
% subplot(3,3,1)
% imshow(a)
% title('original')
% subplot(3,3,2)
% imshow(histeq(a,255))
% title('built in')
% subplot(3,3,3)
% imshow(new)
% title('implemented')
% %histograms
% subplot(3,3,4)
% plot(imhist(a))
% subplot(3,3,5)
% plot(imhist(histeq(a,255)))
% subplot(3,3,6)
% plot(imhist(new))
