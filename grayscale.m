%% Sylvester Benson-Sesay. BME 221 Lab#3 Image Processing. March 4 2019
%% Purpose: The purpose of this lab is to perform image analysis using matlab. Just like  statistical analysis, matlab can be used to analyze and process images for desired results. This lab will investigate the use of grayscale and intensity of image. The lab will also expolre the use of masking to select regions of an image that will be used to apply the threshold technique. 

%% Visualization of the data
%% 1a) Load data
load('filename'); % load data

%% 1b) Four Images at Different Time Points.

figure
subplot(2,2,1) % Making a subplot all the images
imagesc(ICGtime1)
title('ICGtime1')
colorbar           % colorbar display
colormap('gray')  % gray scale

subplot(2,2,2)   % Making a subplot all the images
imagesc(ICGtime12)
title('ICGtime12')
colorbar          % colorbar display
colormap('gray') % gray scale

subplot(2,2,3)  % Making a subplot all the images
imagesc(ICGtime18)
title('ICGtime18')
colorbar            % colorbar display
colormap('gray')    % gray scale

subplot(2,2,4)  % Making a subplot all the images
imagesc(ICGtime5)
title('ICGtime5')
colorbar         % colorbar display
colormap('gray')  % gray scale

%% 1c)  Fixed Intensity Range

figure
subplot(2,2,1)
imagesc(ICGtime1)
title('ICGtime1')
colorbar
colormap('gray')
caxis([0 1000]) % fixed intensity range

% subplot displaying four images
subplot(2,2,2)
imagesc(ICGtime12)
title('ICGtime12')
colorbar
colormap('gray')
caxis([0 1000]) % fixed intensity range

subplot(2,2,3)
imagesc(ICGtime18)
title('ICGtime18')
colorbar
colormap('gray')
caxis([0 1000]) % fixed intensity range

subplot(2,2,4)
imagesc(ICGtime5)
title('ICGtime5')
colorbar
colormap('gray')
caxis([0 1000]) % fixed intensity range

% fixed intensity range justification
disp('A fixed range of 0 to 1000 was selected because  the minimum and maximum of all the images all within this range.')

%% 1d Importance of Fixed Intensity
disp('\n The importance of standardized intensity is greatly emphasized. The flourescence of the images above use color to give vital information about the images. When not standardized, the brightness of the images is not based on their florescence(b), however, when the color intensity is standardized the image we could tell the true brightness of the images(c).')

%% Region of Interest Selection
%% 2a) Three Masks
mask1 = 0.*(ICGtime12); % make matrice zeros
mask1(281:680,1:430) = 1; % area of interest

mask2 = 0.*(ICGtime12); % make matrice zeros
mask2(451:850,431:860) = 1; % area of interest

mask3 = 0.*(ICGtime12); % make matrice zeros
mask3(531:920,1121:1390) = 1; % area of interest


%% 2b) ICGtime12 Sectioning

% multiply  the ICGtime12 with each mask
img1 = ICGtime12 .* mask1; 
img2 = ICGtime12 .* mask2;
img3 = ICGtime12 .* mask3;

figure
% Display each masked image at fixed intensities and gray scale
imagesc(img1)
title('Region 1')
colorbar
colormap('gray')
caxis([0 1000])

imagesc(img2)
title('Region 2')
colorbar
colormap('gray')
caxis([0 1000])

imagesc(img3)
title('Region 3')
colorbar
colormap('gray')
caxis([0 1000])

%% Thresholding to Select Blood Vessels
%% 3a) Identifying Blood Vessel Pixels
figure % region 1
X = img1;
img1(X>=740) = 1; % make pixel white if equal or greater than 740
img1(X<740) = 0;  % darken iif less than threshold (740)
imshow(img1)
title('Region 1')

figure % region 2
Y = img2;
img2(Y>=780) = 1;  % make pixel white if equal or greater than 780
img2(Y<780) = 0; % darken iif less than threshold (780)
imshow(img2)
title('Region 2')

figure
Z = img3;
img3(Z>=520) = 1;  % make pixel white if equal or greater than 520
img3(Z<520) = 0;  % darken iif less than threshold (520)
imshow(img3)
title('Region 3')

 disp(' Increasing the threshold values will highlight less images becuase all pixel values less than the threshold will not be highlighted, decrease does the reverse as more pixel values wil be highlighted. Thus the shape of the blood vessels will change; increased threshold shrink the blood vessel shape and decreased will do the reverse.')

%% 3b Side-by-side Comparison of Region 1,2 & 3 with Original

figure % subplot of Original and Region 1,2&3. Gray scale with colormap
subplot(2,2,1)
imagesc(ICGtime12) % Original 
title('ICGtime12')
colorbar
colormap('gray')

subplot(2,2,2)
imagesc(img1)  % Region 1
title('Region 1')
colorbar
colormap('gray')

subplot(2,2,3)
imagesc(img2) % Region 2
title('Region 2')
colorbar
colormap('gray')

subplot(2,2,4)
imagesc(img3) % Region 3
title('Region 3')
colorbar
colormap('gray')



