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
% barbara_7 = (double(bitget(barbara, 7)));
% barbara_6 = (double(bitget(barbara, 6)));
% barbara_5 = (double(bitget(barbara, 5)));
% barbara_4 = (double(bitget(barbara, 4)));
% barbara_3 = (double(bitget(barbara, 3)));
% barbara_2 = (double(bitget(barbara, 2)));
% barbara_1 = (double(bitget(barbara, 1)));	% LSB (least significant bit plane)

%% look-up table

rng(25)		% seed the random number generator with the user specified key
lut = rand(1,256) > 0.5;	% generate look-up table values
% lut = lut(1:10);
%%

peppers = peppers(1:10);
b8 = barbara_8(1:10);
%%
% for i = 1:length(lut)		% for each row:
% 	for j = 1:length(i)		% each pixel value
% 		if lut(pixel_value) == 0 &&
% 			% embed "0" (unchanged)
% 			encoded_image()
% 
% 		else if lut(pixel_value) == 1
% 			% embed "1" (changed)

barbara(1,:);	% row # 1 of barbara


% 168 163 159 154
%%
clc
[num_rows, num_cols] = size(barbara);

% function index = lut_lookup(value_you_need, n)
% value_you_need = 1;		% either a 1 or 0
% n = 5;					% index you're trying to find the closest 1/0 to

% encoded_image = zeros(size(barbara));
encoded_image = baboon;	% we are trying to embed barbara_8 into peppers
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

		if (barbara_8(i,j) == 0)
			% unchanged, embed same pixel value
			encoded_image(i,j) = baboon(i,j);
		elseif (barbara_8(i,j) == 1)
			% changed, embed closest lut value
% 			encoded_image(i,j) = lut_lookup(barbara_8(i,j),j);
			encoded_image(i,j) = lut_lookup(barbara_8(i,j),double(baboon(i,j)));
		end
% 		encoded_image(i,j) = barbara_8(i,j);
% 		disp(encoded_image(i,j))
% 		disp(i)
% 		disp(j)
% 		disp(' ')

% 		disp(lut(barbara(i)))
% 		disp(['row number: ', num2str(i)])
% 		disp(barbara(i,j))
	end
end

figure
imshow(encoded_image)
% imshow(uint8(encoded_image))
% imshow(double(encoded_image))
figure
imshow(double(encoded_image-baboon))
%%
i = 1;
j = 5;
encoded_image(1,1) = lut_lookup(barbara_8(i,j),j)
%%
lut_lookup(barbara_8(1,1),1)
lut_lookup(barbara_8(1,2),2)
lut_lookup(barbara_8(1,3),3)
lut_lookup(barbara_8(1,4),4)

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



%%
%{
function output_image = ym_watermark(image, binary_watermark, key)
	% image = image to be watermarked
	% binary_watermark
	% key = key used to generate the lookup table
	
	rng(key)		% seed the random number generator with the user specified key
	lut = rand(1,256) > 0.5;	% generate look-up table values
	
	
	output_image = uint8(output_image);

end

%}


function index = lut_lookup(value_you_need, n)

	% value_you_need = 1;		% either a 1 or 0
	% n = 5;					% index you're trying to find the closest 1/0 to
	
	rng(25)		% seed the random number generator with the user specified key
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