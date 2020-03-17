%

function generated = pmap(X)

X = im2double(X); %converts image to double

original = X;

a = [-.25,.5,-.25;.5,0,.5;-.25,.5,-.25]; %linear prediction filter

filtered = conv2(original, a,'same'); %filters image

error = original - filtered; %computes error

generated = exp(error .^2 .*-1); %get's p-map values

generated = uint8(generated);

end

