% ECES 435
% Assignment 2
% Part 1
% Yoni Carver, Jonah Rubino

clear; clc; close all
%% Read Images

peppers = imread('peppers.tif');
baboon = imread('baboon.tif');

%% Create Directories for Different Quality Images

mkdir('peppers');
mkdir('baboon');

%% Write Different Quality Images

imwrite(peppers, 'peppers/peppers_90.jpeg', 'Quality', 90)
imwrite(peppers, 'peppers/peppers_70.jpeg', 'Quality', 70)
imwrite(peppers, 'peppers/peppers_50.jpeg', 'Quality', 50)
imwrite(peppers, 'peppers/peppers_30.jpeg', 'Quality', 30)
imwrite(peppers, 'peppers/peppers_10.jpeg', 'Quality', 10)

imwrite(baboon, 'baboon/baboon_90.jpeg', 'Quality', 90)
imwrite(baboon, 'baboon/baboon_70.jpeg', 'Quality', 70)
imwrite(baboon, 'baboon/baboon_50.jpeg', 'Quality', 50)
imwrite(baboon, 'baboon/baboon_30.jpeg', 'Quality', 30)
imwrite(baboon, 'baboon/baboon_10.jpeg', 'Quality', 10)

%% Calculate PSNR of each image & JPEG compressed images

peppers_90 = imread('peppers/peppers_90.jpeg');
peppers_70 = imread('peppers/peppers_70.jpeg');
peppers_50 = imread('peppers/peppers_50.jpeg');
peppers_30 = imread('peppers/peppers_30.jpeg');
peppers_10 = imread('peppers/peppers_10.jpeg');

baboon_90 = imread('baboon/baboon_90.jpeg');
baboon_70 = imread('baboon/baboon_70.jpeg');
baboon_50 = imread('baboon/baboon_50.jpeg');
baboon_30 = imread('baboon/baboon_30.jpeg');
baboon_10 = imread('baboon/baboon_10.jpeg');

%%

psnr_peppers_90 = psnr(peppers_90, peppers);
psnr_peppers_70 = psnr(peppers_70, peppers);
psnr_peppers_50 = psnr(peppers_50, peppers);
psnr_peppers_30 = psnr(peppers_30, peppers);
psnr_peppers_10 = psnr(peppers_10, peppers);

psnr_baboon_90 = psnr(baboon_90, baboon);
psnr_baboon_70 = psnr(baboon_70, baboon);
psnr_baboon_50 = psnr(baboon_50, baboon);
psnr_baboon_30 = psnr(baboon_30, baboon);
psnr_baboon_10 = psnr(baboon_10, baboon);

%% Filesize (in bytes)

dir_peppers = dir('peppers.tif');
dir_peppers_90 = dir('peppers/peppers_90.jpeg');
dir_peppers_70 = dir('peppers/peppers_70.jpeg');
dir_peppers_50 = dir('peppers/peppers_50.jpeg');
dir_peppers_30 = dir('peppers/peppers_30.jpeg');
dir_peppers_10 = dir('peppers/peppers_10.jpeg');

fsize_peppers = dir_peppers.bytes;
fsize_peppers_90 = dir_peppers_90.bytes;
fsize_peppers_70 = dir_peppers_70.bytes;
fsize_peppers_50 = dir_peppers_50.bytes;
fsize_peppers_30 = dir_peppers_30.bytes;
fsize_peppers_10 = dir_peppers_10.bytes;

dir_baboon = dir('baboon.tif');
dir_baboon_90 = dir('baboon/baboon_90.jpeg');
dir_baboon_70 = dir('baboon/baboon_70.jpeg');
dir_baboon_50 = dir('baboon/baboon_50.jpeg');
dir_baboon_30 = dir('baboon/baboon_30.jpeg');
dir_baboon_10 = dir('baboon/baboon_10.jpeg');

fsize_baboon = dir_baboon.bytes;
fsize_baboon_90 = dir_baboon_90.bytes;
fsize_baboon_70 = dir_baboon_70.bytes;
fsize_baboon_50 = dir_baboon_50.bytes;
fsize_baboon_30 = dir_baboon_30.bytes;
fsize_baboon_10 = dir_baboon_10.bytes;
%%
disp(['peppers: ', num2str(fsize_peppers), ' bytes']);
disp(['peppers_90: ', num2str(fsize_peppers_90), ' bytes (', num2str(fsize_peppers/fsize_peppers_90), ' times smaller than the original image)']);
disp(['peppers_70: ', num2str(fsize_peppers_70), ' bytes (', num2str(fsize_peppers/fsize_peppers_70), ' times smaller than the original image)']);
disp(['peppers_50: ', num2str(fsize_peppers_50), ' bytes (', num2str(fsize_peppers/fsize_peppers_50), ' times smaller than the original image)']);
disp(['peppers_30: ', num2str(fsize_peppers_30), ' bytes (', num2str(fsize_peppers/fsize_peppers_30), ' times smaller than the original image)']);
disp(['peppers_10: ', num2str(fsize_peppers_10), ' bytes (', num2str(fsize_peppers/fsize_peppers_10), ' times smaller than the original image)']);

disp(['baboon: ', num2str(fsize_baboon), ' bytes']);
disp(['baboon_90: ', num2str(fsize_baboon_90), ' bytes (', num2str(fsize_baboon/fsize_baboon_90), ' times smaller than the original image)']);
disp(['baboon_70: ', num2str(fsize_baboon_70), ' bytes (', num2str(fsize_baboon/fsize_baboon_70), ' times smaller than the original image)']);
disp(['baboon_50: ', num2str(fsize_baboon_50), ' bytes (', num2str(fsize_baboon/fsize_baboon_50), ' times smaller than the original image)']);
disp(['baboon_30: ', num2str(fsize_baboon_30), ' bytes (', num2str(fsize_baboon/fsize_baboon_30), ' times smaller than the original image)']);
disp(['baboon_10: ', num2str(fsize_baboon_10), ' bytes (', num2str(fsize_baboon/fsize_baboon_10), ' times smaller than the original image)']);




