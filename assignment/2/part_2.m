% ECES 435
% Assignment 2
% Part 2
% Yoni Carver, Jonah Rubino

clear; clc; close all
%%

peppers = imread('peppers.tif');
% peppers = double(peppers);

% standard JPEG luminance quantization table
Q = [16 11 10 16 24 40 51 61
	12 12 14 19 26 58 60 55
	14 13 16 24 40 57 69 56
	14 17 22 29 51 87 80 62
	18 22 37 56 68 109 103 77
	24 35 55 64 81 104 113 92
	49 64 78 87 103 121 120 101
	72 92 95 98 112 100 103 99];


encoded_image = jpeg_encoder(peppers, Q);
disp(['Size of encoded image file: ', num2str(encoded_image), ' bytes'])
%%
decoded_image = jpeg_decoder();



%%

% [rows columns] = size(peppers);
% 
% % 8 x 8 pixel blocks
% block_row = 8;
% block_col = 8;
% 
% num_of_block_rows = rows / block_row;
% blockVectorR = block_row * ones(1, num_of_block_rows);
% 
% num_of_block_cols = columns / block_col;
% blockVectorC = block_col * ones(1, num_of_block_cols);
% 
% ca = mat2cell(peppers, blockVectorR, blockVectorC);

% imshow([vertcat(ca{1:64}) vertcat(ca{65:128}) vertcat(ca{129:192}) vertcat(ca{193:256})])





%% ENCODE

% fnc = @(y) ZigzagMtx2Vector(dct2(y)./Q)';
% fnc = @(y) ZigzagMtx2Vector(dct(double(y))./Q)';
fnc = @(y) ZigzagMtx2Vector(dct2(y)./Q)';
% fnc = @(y) ZigzagMtx2Vector(dct2(y))';

j = blkproc(peppers, [8 8], fnc);	% process each 8x8 block with function "fnc"
% figure
% imshow(j)

% zz_vector = ZigzagMtx2Vector(j);
% Vector2ZigzagMtx(zz_vector);

% [Len]=JPEG_entropy_encode(rowN, colN, dct_block_size, Q, ZZDCTQIm, encoder_path, DisplayProcess_Flag)
rowN = 512;
colN = 512;
dct_block_size = 8;
% Q = Q
ZZDCTQIm = j;	% 4096 x 64
encoder_path = './';
DisplayProcess_Flag = 0;

% enco = JPEG_entropy_encode(rowN, colN, dct_block_size, Q, ZZDCTQIm, encoder_path, DisplayProcess_Flag); % encodes the sequence of quantized DCT coeffcients
%% DECODE

decoder_path = './';

[rowN,colN,dct_block_size,iQ,iZZDCTQIm] = JPEG_entropy_decode(decoder_path);
%%Vector2ZigzagMtx
% kk = Vector2ZigzagMtx(iZZDCTQIm);

fnc_decode = @(y) ( (idct2(y)) .* iQ);
% fnc_decode = @(y) ((dctmtx(size(y,1)).*double(y)).*iQ);

jj = blkproc(iZZDCTQIm, [8 8], fnc_decode);


imshow(Vector2ZigzagMtx(jj))

%% Encode function

% function y = blkproc_function(matrix)
% 	y = dct2(matrix);
% 	
% 	Q = [16 11 10 16 24 40 51 61
% 		12 12 14 19 26 58 60 55
% 		14 13 16 24 40 57 69 56
% 		14 17 22 29 51 87 80 62
% 		18 22 37 56 68 109 103 77
% 		24 35 55 64 81 104 113 92
% 		49 64 78 87 103 121 120 101
% 		72 92 95 98 112 100 103 99];
% 	
% 	y = (y ./ Q);
% 	
% end

function encode = jpeg_encoder(image, Q)

	image = uint8(image);
	
	fnc = @(y) ZigzagMtx2Vector(dct2(y)./Q)';
% 	fnc = @(y) ZigzagMtx2Vector((dctmtx(size(y,1)).*double(y))./Q)';
% 	fnc = @(y) ZigzagMtx2Vector(dct(double(y))./Q)';

	j = blkproc(image, [8 8], fnc);	% process each 8x8 block with function "fnc"

	% [Len]=JPEG_entropy_encode(rowN, colN, dct_block_size, Q, ZZDCTQIm, encoder_path, DisplayProcess_Flag)
	rowN = 512;
	colN = 512;
	dct_block_size = 8;
	% Q = Q
	ZZDCTQIm = j;	% 4096 x 64
	encoder_path = './';
	DisplayProcess_Flag = 0;

	encode = JPEG_entropy_encode(rowN, colN, dct_block_size, Q, ZZDCTQIm, encoder_path, DisplayProcess_Flag); % encodes the sequence of quantized DCT coeffcients
	
end


function decode = jpeg_decoder()

	% function [rowN,colN,dct_block_size,iQ,iZZDCTQIm]=JPEG_entropy_decode(decoder_path)

	% rowN = 512;
	% colN = 512;
	% dct_block_size = 8;
	% iQ
	% iZZDCTQIm

	decoder_path = './';

	decode = JPEG_entropy_decode(decoder_path);

end