% ECES 435
% Assignment 1
% Part 2
% Yoni Carver, Jonah Rubino

clear; clc; close all
%%
moon = imread('moon.tiff');
outoffocus = imread('outoffocus.tif');

%%

% image = moon;
image = outoffocus;

sharp_image_1 = sharpen(image, 1);
sharp_image_5 = sharpen(image, 5);
sharp_image_10 = sharpen(image, 10);
sharp_image_25 = sharpen(image, 25);
sharp_image_50 = sharpen(image, 100);

%%
figure

subplot(2, 3, 2)
imshow(image)
title('\color{blue}Original Image')

subplot(2, 3, 1)
imshow(sharp_image_1)
title('Image with \alpha = 1')

subplot(2, 3, 3)
imshow(sharp_image_5)
title('Image with \alpha = 5')

subplot(2, 3, 4)
imshow(sharp_image_10)
title('Image with \alpha = 10')

subplot(2, 3, 5)
imshow(sharp_image_25)
title('Image with \alpha = 25')

subplot(2, 3, 6)
imshow(sharp_image_50)
title('Image with \alpha = 50')

%%
function sharp_image = sharpen(image, alpha)
	%{
	sharpened image equation: f_s(x,y) = f(x,y) + ?g(x,y)
		f(x,y) = original image
		? = user-specified scaling constant
		g(x,y) = high frequency content (found using the Laplacian filter)
	%}

	% laplacian filter to obtain the high frequency data from the image
	laplacian_filter = [0 -0.25 0; -0.25 1 -0.25; 0 -0.25 0];
	
	% filter the original image with ?*g(x,y)
	image_high_freq = filter2(alpha * laplacian_filter, image);
	
	% sum the high frequency component with the original image to obtain the
	% sharpened image
	sharp_image = uint8(double(image) + double(image_high_freq));
		
end










