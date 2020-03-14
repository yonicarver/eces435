%ECES 435 Assignment #4
%Jonah Rubino Yoni Carver
%The purpose of this code is to determine if an imagehas a history of image
%compression by way of the Fan and De Quieroz method

function detection = compressdetect(image)

imd = im2double(image); %converts image to a double
[r,c]= size(imd); %gets size of image
r = r/8; % gets the number of 8x8 rows
c = c/8; %gets the number of 8x8 columns
shape = reshape(imd,8,r, 8, c); %creates the 8x8 blocks
blocks = permute(shape, [1 3 2 4]); %concatenates the blocks to form the image made of 8x8 blocks


%calculates the Z' values
for j = 1:c-1
    for i = 1:r-1
        A = blocks(4,4,i,j);
        B = blocks(4,5,i,j);
        C = blocks(5,4,i,j);
        D = blocks(5,5,i,j);
        Zprime(i,j) = abs(A-B-C+D);
    end
end

%calculates the Z'' values
for j = 1:c-1
    for i = 1:r-1
        E = blocks(8,8,i,j);
        F = blocks(8,1,i,j+1);
        G = blocks(1,8,i+1,j);
        H = blocks(1,1,i+1,j+1);
        Zdprime(i,j)= abs(E-F-G+H);
    end
end


%Plot the normalized Histogram of Z' and Z''
subplot(2,1,1)
H1 = histogram(Zprime,'Normalization', 'probability');
title('Zprime')
hold on
subplot(2,1,2)
H2 = histogram(Zdprime,'Normalization', 'probability');
title('Z double prime')



hist1 = H1.Values;
hist2 = H2.Values;

K = 0;
for i = 1: length(hist2)
    K = K + abs(hist1(i) - hist2(i)); %calculate the Strength value 
end

disp(K)
if K > 0.25 %checks the threshold value to see if there was compression
    output = 1;
else
    output = 0;
end

if output == 1
    detection = 'There is evidence of JPEG compression'; %output if K is larger than thresh hold
else
    detection = 'There is no evidence of JPEG compression'; %%output if K is not larger than thresh hold
end
