img = imread('jupiter.jpg');
%img = imresize(img,[256,256]);
%figure(1);
%imshow(img);

%******separating RGB components of image********
img_r = img(:,:,1);
img_g = img(:,:,2);
img_b = img(:,:,3);

%*******Grayscale*******
img_gray = rgb2gray(img);

%******display RGB and Grayscale components********
figure(2);
img_2 = zeros(size(img));
img_2 = uint8(img_2);
img_2_red = img_2;
img_2_red(:,:,1) = img_r;
img_2_green = img_2;
img_2_green(:,:,2) = img_g;
img_2_blue = img_2;
img_2_blue(:,:,3) = img_b;
subplot(221),imshow(img_gray),title('Grayscale');
subplot(222),imshow(img_2_red),title('Red');
subplot(223),imshow(img_2_green),title('Green');
subplot(224),imshow(img_2_blue),title('Blue');

%******Histogram of Grayscale**********
figure(3);
subplot(121),imshow(img_gray),title('Grayscale');
subplot(122),imhist(img_gray),title('Gray Histogram');

%**********negative film***********
img_neg = 255-img;
figure(4);
subplot(121),imshow(img),title('Original'),colorbar;
subplot(122),imshow(img_neg),title('Negative Film'),colorbar;
