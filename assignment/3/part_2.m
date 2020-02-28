% ECES 435
% Assignment 3
% Part 2 - Yeung-Mintzer Watermarking
% Yoni Carver, Jonah Rubino

%{
Hide the most-significant bit plane of barbara.tif in peppers.tif and baboon.tif
%}

clear; clc; close all
%% Load Images

barbara = imread('Barbara.bmp');
peppers = imread('peppers.tif');
baboon = imread('baboon.tif');

%%

barbara_8 = (double(bitget(barbara, 8)));	% MSB (most significant bit plane)

% function encoded_image = ym_watermark(image, binary_watermark, key)

binary_watermark = barbara_8;
key = 435;

peppers_encoded_image = ym_watermark(peppers, binary_watermark, key);
baboon_encoded_image = ym_watermark(baboon, binary_watermark, key);

figure
subplot(1,3,1)
imshow(peppers)
title('Original Image (peppers.tif)')
subplot(1,3,2)
imshow(peppers_encoded_image)
title('Encoded Image')
subplot(1,3,3)
imshow(double(peppers_encoded_image - peppers))
title('Encoded Image - Original Image')

figure
subplot(1,3,1)
imshow(baboon)
title('Original Image (baboon.tif)')
subplot(1,3,2)
imshow(baboon_encoded_image)
title('Encoded Image')
subplot(1,3,3)
imshow(double(baboon_encoded_image - baboon))
title('Encoded Image - Original Image')

imwrite(peppers_encoded_image, 'peppers_encoded_image.tif')
imwrite(baboon_encoded_image, 'baboon_encoded_image.tif')

%% FUNCTIONS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function encoded_image = ym_watermark(image, binary_watermark, key)

	% image = image to place the watermark into
	% binary_watermark = most significant bit plane of watermark image that you
	%					 wish to embed into <image>
	% key = seed the random number generator with the user specified key
	
	rng(key)		% seed the random number generator with the user specified key
	lut = rand(1,256) > 0.5;	% generate look-up table values
	
	[num_rows, num_cols] = size(image);

	encoded_image = image;	% make sure encoded_image and image are the same size and type
	for i = 1:num_rows		% for each row
		for j = 1:num_cols	% for each pixel of each row
			if (binary_watermark(i,j) == 0)
				% unchanged, embed same pixel value
				encoded_image(i,j) = image(i,j);
			elseif (binary_watermark(i,j) == 1)
				% changed, embed closest lut value
				encoded_image(i,j) = lut_lookup(key, binary_watermark(i,j),double(image(i,j)));
			end
		end
	end
end


function index = lut_lookup(key, value_you_need, n)

	% key = seed the random number generator with the user specified key
	% value_you_need = either a 1 or 0, depending on what the current watermark
	%				   pixel value is
	% n = the index you're trying to find the closest value_you_need to

	% this function returns the index of the closest 1 or 0 to the current index
	% you're looking at
	
	rng(key)		% seed the random number generator with the user specified key
	lut = rand(1,256) > 0.5;	% generate look-up table values
	idx_needed = find(lut == value_you_need);	% all the places where the lut is equal to the value you need

	positive_index = min(idx_needed((idx_needed - n) > 0));		% closest positive index

	negative_index = max(idx_needed((idx_needed - n) < 0));		% closest negative index

	% contains some error catching for beginning and end of lut
	if (n == 1) || isempty(negative_index)
		index = positive_index;
	elseif (n == length(lut))
		index = negative_index;
	elseif ((positive_index - n) < (n - negative_index))
		% if the distance between the current index you're looking at and the
		% positive index is less than the distance between the current index and the
		% negative index, set the index to the positive index
		index = positive_index;
	else
		index = negative_index;
	end
end