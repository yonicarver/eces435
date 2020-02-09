% ECES 435
% Assignment 2
% Part 2
% Yoni Carver, Jonah Rubino

clear; clc; close all
%%

peppers = imread('peppers.tif');
% peppers = double(peppers);
%%

[rows columns] = size(peppers);

% 8 x 8 pixel blocks
block_row = 8;
block_col = 8;

num_of_block_rows = rows / block_row;
blockVectorR = block_row * ones(1, num_of_block_rows);

num_of_block_cols = columns / block_col;
blockVectorC = block_col * ones(1, num_of_block_cols);

ca = mat2cell(peppers, blockVectorR, blockVectorC);

% imshow([vertcat(ca{1:64}) vertcat(ca{65:128}) vertcat(ca{129:192}) vertcat(ca{193:256})])





%%
% fun = @dct2;	% 2D DCT
fun = @blkproc_function;
j = blkproc(peppers, [8 8], fun);
% figure
% imshow(j)

zz_vector = ZigzagMtx2Vector(j);
% Vector2ZigzagMtx(zz_vector);

% [Len]=JPEG_entropy_encode(rowN, colN, dct_block_size, Q, ZZDCTQIm, encoder_path, DisplayProcess_Flag)
enco = JPEG_entropy_encode(8, 8, 8, Q, zz_vector, './', 1); %encodes the sequence of quantized DCT coeffcients



%% Encode function

function y = blkproc_function(matrix)
	y = dct2(matrix);
	
	Q = [16 11 10 16 24 40 51 61
		12 12 14 19 26 58 60 55
		14 13 16 24 40 57 69 56
		14 17 22 29 51 87 80 62
		18 22 37 56 68 109 103 77
		24 35 55 64 81 104 113 92
		49 64 78 87 103 121 120 101
		72 92 95 98 112 100 103 99];
	
	y = (y ./ Q);
	
end

% function encode = jpeg_encoder(image, quantization_table)
% 
% 	image = double(image);
% 	
% 
% end