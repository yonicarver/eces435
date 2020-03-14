% ECES 435
% Assignment 4
% Part 2 - Detecting JPEG Compression Using Blocking Artifacts
% Yoni Carver, Jonah Rubino

%{

%}

clear; clc; close all
%% LOAD IMAGES

ba1 = imread('blockArtifacts1.tif');
ba2 = imread('blockArtifacts2.tif');
ba3 = imread('blockArtifacts3.tif');

%%

eta = 0.25;		% detection threshold

test = [1  2  3  4  5  6  7  8
		9  10 11 12 13 14 15 16
		17 18 19 20 21 22 23 24
		25 26 27 28 29 30 31 32
		33 34 35 36 37 38 39 40
		41 42 43 44 45 46 47 48
		49 50 51 52 53 54 55 56
		57 58 59 60 61 62 63 64];

zp = abs(28 - 29 - 36 + 37);
% zdp = 
	
%%

[num_rows, num_cols] = size(ba1);
z_prime = zeros((num_rows/8), (num_cols/8));

% encoded_image = zeros(size(ba1));	% make sure encoded_image and image are the same size and type
% for i = 1:num_rows/8		% for each row
% 	for j = 1:num_cols/8	% for each pixel of each row
% 		z_prime(i,j) = ba1(i,j);
% 	end
% end

fnc = @(y) (abs(y(4,4) - y(4,5) - y(5,4) + y(5,5)));
jj = blkproc(ba1, [8 8], fnc);

imshow(jj)






