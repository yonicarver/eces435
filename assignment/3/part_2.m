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

%%

[num_rows, num_cols] = size(barbara);

% function index = lut_lookup(value_you_need, n)
% value_you_need = 1;		% either a 1 or 0
% n = 5;					% index you're trying to find the closest 1/0 to

% encoded_image = zeros(size(barbara));
encoded_image = baboon;	% we are trying to embed barbara_8 into peppers
% for i = 1:num_rows		% for each row
for i = 1:5
% 	for j = 1:num_cols	% for each pixel of each row
	for j = 1:50
% 		if lut(barbara(i,j)) == 0
% 			disp('got a 0')
% 		elseif lut(barbara(i,j)) == 1
% 			disp('got a 1')
% 		end
% 		lut_lookup(barbara_8(index,j),j);
% 		(barbara_8(index,j))
% 		disp(lut(barbara(i,j)))

		if (barbara_8(i,j) == 0)
			% unchanged, embed same pixel value
			encoded_image(i,j) = baboon(i,j);
		elseif (barbara_8(i,j) == 1)
			% changed, embed closest lut value
% 			encoded_image(i,j) = lut_lookup(barbara_8(i,j),j);
			encoded_image(i,j) = lut_lookup(key, barbara_8(i,j),double(baboon(i,j)));
		end

% 		disp(lut(barbara(i)))
% 		disp(['row number: ', num2str(i)])
% 		disp(barbara(i,j))
	end
end

figure
imshow(encoded_image)
title('Encoded Image')
% imshow(uint8(encoded_image))
% imshow(double(encoded_image))
figure
imshow(double(encoded_image-baboon))
title('Encoded Image - Original Image')

%% find closest value of 0 or 1

% 			        v
%    1  2  3  4  5  6  7  8  9  10 11 12 13 14 15 16 17
% a = [1  1  0  0  0  0  0  0  1  1  1  0  0  1  1  0  1];

value_you_need = 1;
n = 5;					% index you're trying to find the closest 1 to
% [C,ia,idx] = unique(round(abs(a-n)),'stable');
% [C,ia,idx] = unique((abs(a-n)),'stable');
% minVal = a(idx == 1);
% closest_idx = ;			% should return 8
% find(abs(a-n) == min(abs(a-n)))

idx_needed = find(lut == value_you_need);	% all the places where the lut is equal to the value you need
% a(n + min(abs(idx_needed-n)))	% returns value at closest index (positive direction)
% (n + min(abs(idx_needed-n)))		% returns index of value of closest index -- good!

% positive_index = (n + min(abs(idx_needed - n)))
positive_index = min(idx_needed((idx_needed - n) > 0));

% find(idx_needed-n > 0)	% returns index, need to get value of that index
% negative_index = (n + max(idx_needed - n))
negative_index = max(idx_needed((idx_needed - n) < 0));

if (n == 1)
	i = positive_index;
elseif (n == length(lut))
	i = negative_index;
elseif ((positive_index - n) < (n - negative_index))
	% if the distance between the current index you're looking at and the
	% positive index is less than the distance between the current index and the
	% negative index, set the index to the positive index
	i = positive_index;
else
	i = negative_index;
end

% clc
disp(['pos: ', num2str(positive_index), ' neg: ', num2str(negative_index), ' index: ', num2str(i)])



%% FUNCTIONS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function encoded_image = ym_watermark(image, binary_watermark, key)

	% image = image to place the watermark into
	% binary_watermark = most significant bit plane of watermark image that you
	%					 wish to embed into <image>
	% key = seed the random number generator with the user specified key
	
	rng(key)		% seed the random number generator with the user specified key
	lut = rand(1,256) > 0.5;	% generate look-up table values
	
	[num_rows, num_cols] = size(image);

	% function index = lut_lookup(value_you_need, n)
	% value_you_need = 1;		% either a 1 or 0
	% n = 5;					% index you're trying to find the closest 1/0 to

	% encoded_image = zeros(size(barbara));
	encoded_image = image;	% we are trying to embed barbara_8 into peppers
	for i = 1:num_rows		% for each row
	% for i = 1:5
		for j = 1:num_cols	% for each pixel of each row
	% 	for j = 1:50
	% 		if lut(barbara(i,j)) == 0
	% 			disp('got a 0')
	% 		elseif lut(barbara(i,j)) == 1
	% 			disp('got a 1')
	% 		end
	% 		lut_lookup(barbara_8(index,j),j);
	% 		(barbara_8(index,j))
	% 		disp(lut(barbara(i,j)))

			if (binary_watermark(i,j) == 0)
				% unchanged, embed same pixel value
				encoded_image(i,j) = image(i,j);
			elseif (binary_watermark(i,j) == 1)
				% changed, embed closest lut value
	% 			encoded_image(i,j) = lut_lookup(barbara_8(i,j),j);
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

	positive_index = min(idx_needed((idx_needed - n) > 0));

	negative_index = max(idx_needed((idx_needed - n) < 0));

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

	% clc
% 	disp(['pos: ', num2str(positive_index), ' neg: ', num2str(negative_index), ' index: ', num2str(index)])
end