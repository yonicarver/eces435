% Assignment #5
%Jonah Rubino and Yoni Carver
%The purpose of this code is to generate an image's p-map

function generated = pmap(X)

double = im2double(X); %converts image to double

original = double;

a = [-.25,.5,-.25;.5,0,.5;-.25,.5,-.25]; %linear prediction filter

filtered = conv2(original, a,'same'); %filters image

error = original - filtered; %computes error

generated = exp(error .^2 .*-1); %get's p-map values



end

