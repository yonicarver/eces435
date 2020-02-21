% ECES 435
% Assignment 3
% Part 2 - Yeung-Mintzer Watermarking
% Yoni Carver, Jonah Rubino

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

[num_rows, num_cols] = size(barbara);
% 168 163 159 154
%%
for i = 1:num_rows		% for each row
% for i = 1
% 	for j = 1:num_cols
	for j = 1:num_cols	% for each pixel of each row
% 		disp(lut(barbara(i)))
		disp(['row number: ', num2str(i)])
		disp(barbara(i,j))
	end
end





%% 
function output_image = ym_watermark(image, binary_watermark, key)
	% image = image to be watermarked
	% binary_watermark
	% key = key used to generate the lookup table
	
	rng(key)		% seed the random number generator with the user specified key
	lut = rand(1,256) > 0.5;	% generate look-up table values
	
	
	output_image = uint8(output_image);

end