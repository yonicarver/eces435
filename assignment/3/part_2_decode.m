% ECES 435
% Assignment 3
% Part 2 - Yeung-Mintzer Watermarking
% Yoni Carver, Jonah Rubino

%{
Extract the most-significant bit plane of barbara.tif in peppers.tif and baboon.tif
%}

clear; clc; close all
%% Load Images

barbara = imread('Barbara.bmp');
peppers = imread('peppers.tif');
baboon = imread('baboon.tif');
%%
peppers_encoded = imread('peppers_encoded_image.tif');
baboon_encoded = imread('baboon_encoded_image.tif');
YMwmkedKey435_encoded = imread('YMwmkedKey435.tiff');

% barbara_8 = (double(bitget(barbara, 8)));	% MSB (most significant bit plane)

%%

key = 435;

% function watermark = ym_decode(watermarked_image, key)

peppers_decoded_image = ym_decode(peppers_encoded, key);
baboon_decoded_image = ym_decode(baboon_encoded, key);
YMwmkedKey435_decoded_image = ym_decode(YMwmkedKey435_encoded, key);


figure
imshow(double(peppers_decoded_image))
figure
imshow(double(baboon_decoded_image))
figure
imshow(double(YMwmkedKey435_decoded_image))
% imwrite(YMwmkedKey435_decoded_image, 'YMwmkedKey435_decoded_image.tiff')
%% half peppers_encoded half baboon_encoded

peppers_baboon_combined = [(peppers_encoded_image(1:256,1:512)) ; (baboon_encoded_image(257:512,1:512))];
% imshow(peppers_baboon_combined)

combined_decoded_image = ym_decode(peppers_baboon_combined, key);
% imshow(combined_decoded_image)

%% FUNCTIONS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function watermark = ym_decode(watermarked_image, key)

	% watermarked_image = image that contains the watermark you wish to extract
	% key = seed the random number generator with the user specified key

	% watermark = watermark that has been extracted from watermarked_image
	
	
	rng(key)		% seed the random number generator with the user specified key
	lut = rand(1,256) > 0.5;	% generate look-up table values

	[num_rows, num_cols] = size(watermarked_image);		% dimensions of watermarked_image

	watermark = watermarked_image;	% make sure watermark and watermarked image are the same size and type

	for i = 1:num_rows		% for each row
		for j = 1:num_cols	% for each pixel of each row
			if watermarked_image(i,j) == 0
				% if the pixel value is equal to 0, set the watermark value to 0
				watermark(i,j) = 0;
			elseif lut(watermarked_image(i,j)) == 0
				% if the lut at index (i,j) is 0, set the watermark index to 0
				watermark(i,j) = 0;
			elseif lut(watermarked_image(i,j)) == 1
				% if the lut at index (i,j) is 1, set the watermark index to 1
				watermark(i,j) = 1;
			end
		end
	end
end
