pn1 = imread('peppersNoise1.tiff'); %Reads in the image

pn1 = im2double(pn1); %Converts image to a double to filter

pn1med3 = medfilt2(pn1,[3 3]); %Performs a median filter 

h1 = ones(3,3)/9; %Set's the matrix up for the averaging filter

pn1avg3 = imfilter(pn1,h1); %Runs the image through an averaging filter

sobX = [-1 0 1 ; -2 0 2; -1 0 1]; % X Axis matrix for the Sobel filter
sobY = [-1 -2 -1 ; 0 0 0 ; 1 2 1] ; %Y Axis matrix for the Sobel Filter

med3x = conv2(pn1med3,sobX,'same'); %convolves the image with the X Sobel Matrix
med3y = conv2(pn1med3,sobY,'same'); %convolves the image with the Y Sobel Matrix

medSobel = sqrt(med3x .^2 + med3y .^2); %Computes the magnitude of the gradient

thresh = medSobel <.8; %determines which of the pixels are below the threshold
medSobel(thresh) = 0; %set's all values of the pixels below threshold to 0, creates the edges

avg3x = conv2(pn1avg3,sobX,'same'); %convolves the image with the X Sobel Matrix
avg3y = conv2(pn1avg3,sobY,'same'); %convolves the image with the Y Sobel Matrix

avgSobel = sqrt(avg3x .^2 + avg3y .^2); %Computes the magnitude of the gradient

thresh = avgSobel <.8; %determines which of the pixels are below the threshold
avgSobel(thresh) = 0; %set's all values of the pixels below threshold to 0, creates the edges

montage({medSobel,avgSobel}) %Plots the images next to one another