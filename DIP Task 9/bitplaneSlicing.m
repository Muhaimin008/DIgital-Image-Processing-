img = rgb2gray(imread('tire_orig.jpg'));
[m,n] = size(img);
b = double(img);
c = de2bi(b);

c1 = c(:,1); 
c2 = c(:,2);
c3 = c(:,3);
c4 = c(:,4);
c5 = c(:,5);
c6 = c(:,6);
c7 = c(:,7);
c8 = c(:,8); 

r1 = reshape(c1,m,n);
r2 = reshape(c2,m,n);
r3 = reshape(c3,m,n);
r4 = reshape(c4,m,n);
r5 = reshape(c5,m,n);
r6 = reshape(c6,m,n);
r7 = reshape(c7,m,n);
r8 = reshape(c8,m,n);

figure(1);
subplot(241), imshow(r1), title('LSB layer');
subplot(242), imshow(r2), title('2nd layer');
subplot(243), imshow(r3), title('3rd layer');
subplot(244), imshow(r4), title('4th layer');
subplot(245), imshow(r5), title('5th layer');
subplot(246), imshow(r6), title('6th layer');
subplot(247), imshow(r7), title('7th layer');
subplot(248), imshow(r8), title('MSB layer');

cc= 2*(2*(2*(2*(2*(2*(2*c8+c7)+c6)+c5)+c4)+c3)+c2)+c1;
figure, imshow(uint8(cc)); title('Reconstructed Image');