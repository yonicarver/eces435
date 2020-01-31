%The purpose of this function is to perform gamma correction on a grayscale
%image

function scan = gamcor(x,gamma) %x is the image, and gamma is the parameter
y = im2double(x);
y =  y(:,:,1); %ensures the picture only has 2-D values
imcor = y; %

for i=1:size(y,1) %iterates over the rows
    for j = 1:size(y,2) %iterates over the columns
        pixel = y(i,j); %has the pixel value
        newpix = 255*(pixel/255).^(gamma); %performs the gamma correction
        imcor(i,j) = newpix; %sets pixel at the same position to the new value
    end
end
scan = imcor; %produces filtered image