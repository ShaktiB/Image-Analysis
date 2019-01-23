clear all 
close all 

%% Part 1: Gray-Level Scaling and Histogram Equalization 

img = imread('Mammo CC P1.tif');

% Gray Level Scaling 
img_gray = rgb2gray(img);

% Histogram Equalization
img_hist = histeq(img_gray); % Hist. equalization 

figure; 
subplot(3,1,1);
imshow(img);
title('Original')
subplot(3,1,2);
imshow(img_gray);
title('Gray-Level Scaling')
subplot(3,1,3);
imshow(img_hist);
title('Histogram Equalization (on Grayscale Img)')

% Histrogram of the images before/after equalization 
figure;
subplot(1,2,1);
imhist(img);
title('Histogram of Original Mammogram');
subplot(1,2,2);
imhist(img_hist);
title('Histogram after Equalization');


%% Part 2: Applying Gray-Level Scaling and Hist. Equalization on Brain MRI 

img2 = imread('0001.bmp');
img_gray2 = rgb2gray(img2);
img_hist2 = histeq(img_gray2); % Hist. equalization

figure; 
subplot(3,1,1);
imshow(img2);
title('Original')
subplot(3,1,2);
imshow(img_gray2);
title('Gray-Level Scaling')
subplot(3,1,3);
imshow(img_hist2);
title('Histogram Equalization (on Grayscale Img)')

% Histrogram of the images before/after equalization 
figure;
subplot(1,2,1);
imhist(img2);
title('Histogram of Original Brain MRI Image');
subplot(1,2,2);
imhist(img_hist2);
title('Histogram after Equalization');

%% Part 3: 

img3 = imread('070.tif');
img3gray = rgb2gray(img3); % Convert to gray-scale 

% Fourier transform
F = fft2(img3gray);
F2 = log(abs(F));
F3 = fftshift(F2);

figure;

subplot(2,2,1);
imshow(img3gray);
title('Original');

i1 = subplot(2,2,2);
imagesc(F3);
colormap(i1, gray);
title('Color Map: Gray');

i2 = subplot(2,2,3);
imagesc(F3);
colormap(i2,spring);
title('Color Map: Spring');

i3 = subplot(2,2,4);
imagesc(F3);
colormap(i3,jet);
title('Color Map: Jet');


%% Part 4 

img4 = zeros(256,256); % Creating a 256*256 array of 0s
img4(128:129,128:129) = 255; % Setting the middle 2x2 pixels to = 255 
theFT = abs(fft2(img4)); 

figure;
subplot(1,2,1);
imshow(img4);
title('Original Image');
subplot(1,2,2);
imagesc(theFT);
title('Fourier Spectrum Image');

%% Part 5 

img5 = imread('073.tif');
img5Gray = rgb2gray(img5);
figure;
imshow(img5Gray);
title('Original Image');

% Fourier transform
F5 = fft2(img5Gray);
F5_2 = log(abs(F5));
F5_3 = fftshift(F5_2);

figure;
imagesc(F5_3);
title('Fourier Spectrum Image');

%Inverse Fourier Transform
invF = abs(ifft(F5_3));

% Scale the Inverse Fourier values from 0 to 1 
I = (invF - min(invF(:))) / (max(invF(:)) - min(invF(:)));
I2 = im2uint8(I);

subImg = imsubtract(img5Gray,I2);
figure; 
imshow(subImg);
title('Subtracted Image');

% image8Bit = uint8(255 * mat2gray(invF));
% figure; imshow(image8Bit);
% 
% subImg = imsubtract(img5Gray,image8Bit);
% figure; 
% imshow(subImg);
