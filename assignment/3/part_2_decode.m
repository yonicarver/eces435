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

peppers_encoded = imread('peppers_encoded_image.tif');
baboon_encoded = imread('baboon_encoded_image.tif');
YMwmkedKey435_encoded = imread('YMwmkedKey435.tiff');


barbara_8 = (double(bitget(barbara, 8)));	% MSB (most significant bit plane)

%%

key = 435;

% function watermark = ym_decode(watermarked_image, key)
% peppers_decoded_image = ym_decode(peppers_encoded, key);
% baboon_decoded_image = ym_decode(baboon_encoded, key);
YMwmkedKey435_decoded_image = ym_decode(YMwmkedKey435_encoded, key);


% figure
% imshow(peppers_decoded_image)
% figure
% imshow(baboon_decoded_image)
figure
imshow(YMwmkedKey435_decoded_image)
imwrite(YMwmkedKey435_decoded_image, 'YMwmkedKey435_decoded_image.tiff')

%%
% inputs:
% 	watermarked_image
%	key


rng(key)		% seed the random number generator with the user specified key
lut = rand(1,256) > 0.5;	% generate look-up table values

[num_rows, num_cols] = size(watermarked_image);

% function index = lut_lookup(value_you_need, n)
% value_you_need = 1;		% either a 1 or 0
% n = 5;					% index you're trying to find the closest 1/0 to

% encoded_image = zeros(size(barbara));
watermark = zeros(size(watermarked_image));

for i = 1:num_rows		% for each row
% for i = 1:18
	for j = 1:num_cols	% for each pixel of each row
% 	for j = 1:50
		if watermarked_image(i,j) == 0
			watermark(i,j) = 0;
		elseif lut(double(watermarked_image(i,j))) == 0
% 			disp('got a 0')
			watermark(i,j) = 0;
		elseif lut(double(watermarked_image(i,j))) == 1
% 			disp('got a 1')
			watermark(i,j) = 1;
		end
% 		disp(['i: ', num2str(i)])
% 		disp(['j: ', num2str(j)])
% 		disp(['watermarked_value at (',num2str(i), ',', num2str(j), '): ', num2str(watermarked_image(i,j))])
% 		disp(' ')
	end
end

figure
imshow(watermark)

%% FUNCTIONS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function watermark = ym_decode(watermarked_image, key)

	% watermarked_image = image that contains the watermark you wish to extract
	% key = seed the random number generator with the user specified key

	rng(key)		% seed the random number generator with the user specified key
	lut = rand(1,256) > 0.5;	% generate look-up table values

	[num_rows, num_cols] = size(watermarked_image);

	% function index = lut_lookup(value_you_need, n)
	% value_you_need = 1;		% either a 1 or 0
	% n = 5;					% index you're trying to find the closest 1/0 to

	% encoded_image = zeros(size(barbara));
	watermark = ones(size(watermarked_image));

	for i = 1:num_rows		% for each row
	% for i = 1:18
		for j = 1:num_cols	% for each pixel of each row
	% 	for j = 1:50
			if watermarked_image(i,j) == 0
				watermark(i,j) = 0;
			elseif lut(watermarked_image(i,j)) == 0
				watermark(i,j) = 0;
			elseif lut(watermarked_image(i,j)) == 1
% 				watermark(i,j) = 1;
				watermark(i,j) = lut_lookup(key, 0, double(watermarked_image(i,j)));
			end
	% 		disp(['i: ', num2str(i)])
	% 		disp(['j: ', num2str(j)])
	% 		disp(['watermarked_value at (',num2str(i), ',', num2str(j), '): ', num2str(watermarked_image(i,j))])
	% 		disp(' ')
		end
	end

end



% function encoded_image = ym_watermark(image, binary_watermark, key)
% 
% 	% image = image to place the watermark into
% 	% binary_watermark = most significant bit plane of watermark image that you
% 	%					 wish to embed into <image>
% 	% key = seed the random number generator with the user specified key
% 	
% 	rng(key)		% seed the random number generator with the user specified key
% 	lut = rand(1,256) > 0.5;	% generate look-up table values
% 	
% 	[num_rows, num_cols] = size(image);
% 
% 	% function index = lut_lookup(value_you_need, n)
% 	% value_you_need = 1;		% either a 1 or 0
% 	% n = 5;					% index you're trying to find the closest 1/0 to
% 
% 	% encoded_image = zeros(size(barbara));
% 	encoded_image = image;	% we are trying to embed barbara_8 into peppers
% 	for i = 1:num_rows		% for each row
% 	% for i = 1:5
% 		for j = 1:num_cols	% for each pixel of each row
% 	% 	for j = 1:50
% 	% 		if lut(barbara(i,j)) == 0
% 	% 			disp('got a 0')
% 	% 		elseif lut(barbara(i,j)) == 1
% 	% 			disp('got a 1')
% 	% 		end
% 	% 		lut_lookup(barbara_8(index,j),j);
% 	% 		(barbara_8(index,j))
% 	% 		disp(lut(barbara(i,j)))
% 
% 			if (binary_watermark(i,j) == 0)
% 				% unchanged, embed same pixel value
% 				encoded_image(i,j) = image(i,j);
% 			elseif (binary_watermark(i,j) == 1)
% 				% changed, embed closest lut value
% 	% 			encoded_image(i,j) = lut_lookup(barbara_8(i,j),j);
% 				encoded_image(i,j) = lut_lookup(key, binary_watermark(i,j),double(image(i,j)));
% 			end
% 
% 	% 		disp(lut(barbara(i)))
% 	% 		disp(['row number: ', num2str(i)])
% 	% 		disp(barbara(i,j))
% 		end
% 	end
% 
% 
% end




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

