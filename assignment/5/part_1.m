% ECES 435
% Assignment 5
% Part 1 - Detecting Image Contrast Enhancement
% Yoni Carver, Jonah Rubino

%{

%}

clear; clc; close all
%% LOAD IMAGES

ce1 = imread('imageCE1.tif');
ce2 = imread('imageCE2.tif');
ce3 = imread('imageCE3.tif');
ce4 = imread('imageCE4.tif');
ce5 = imread('imageCE5.tif');

unalt1 = imread('unaltIm1.tif');
unalt2 = imread('unaltIm2.tif');
unalt3 = imread('unaltIm3.tif');


%%

figure
subplot(1,2,1)
imshow(ce1)
title('imageCE1.tif')
subplot(1,2,2)
bar(imhist(ce1))
title('imhist of "imageCE1.tif"')

figure
subplot(1,2,1)
imshow(ce2)
title('imageCE2.tif')
subplot(1,2,2)
bar(imhist(ce2))
title('imhist of "imageCE2.tif"')

figure
subplot(1,2,1)
imshow(ce3)
title('imageCE3.tif')
subplot(1,2,2)
bar(imhist(ce3))
title('imhist of "imageCE3.tif"')

figure
subplot(1,2,1)
imshow(ce4)
title('imageCE4.tif')
subplot(1,2,2)
bar(imhist(ce4))
title('imhist of "imageCE4.tif"')

figure
subplot(1,2,1)
imshow(ce5)
title('imageCE5.tif')
subplot(1,2,2)
bar(imhist(ce5))
title('imhist of "imageCE5.tif"')

%%

figure
subplot(1,2,1)
imshow(unalt1)
title('unaltIm1.tif')
subplot(1,2,2)
bar(imhist(unalt1))
title('imhist of "unaltIm1.tif"')

figure
subplot(1,2,1)
imshow(unalt2)
title('unaltIm2.tif')
subplot(1,2,2)
bar(imhist(unalt2))
title('imhist of "unaltIm2.tif"')

figure
subplot(1,2,1)
imshow(unalt3)
title('unaltIm3.tif')
subplot(1,2,2)
bar(imhist(unalt3))
title('imhist of "unaltIm3.tif"')

%% Gamma Correction (gamma = 0.7)

gamma = 0.7;

ce1_gc_1 = imadjust(ce1,[],[],gamma);
ce2_gc_1 = imadjust(ce2,[],[],gamma);
ce3_gc_1 = imadjust(ce3,[],[],gamma);
ce4_gc_1 = imadjust(ce4,[],[],gamma);

figure
subplot(2,2,1)
imshow(ce1)
title('imageCE1.tif')
subplot(2,2,2)
bar(imhist(ce1))
title('imhist of "imageCE1.tif"')
subplot(2,2,3)
imshow(ce1_gc_1)
title(['Gamma Corrected (\gamma = ', num2str(gamma), ') imageCE1.tif'])
subplot(2,2,4)
bar(imhist(ce1_gc_1))
title(['imhist of Gamma Corrected (\gamma = ', num2str(gamma),') "imageCE1.tif"'])

figure
subplot(2,2,1)
imshow(ce2)
title('imageCE2.tif')
subplot(2,2,2)
bar(imhist(ce2))
title('imhist of "imageCE2.tif"')
subplot(2,2,3)
imshow(ce2_gc_1)
title(['Gamma Corrected (\gamma = ', num2str(gamma), ') imageCE2.tif'])
subplot(2,2,4)
bar(imhist(ce2_gc_1))
title(['imhist of Gamma Corrected (\gamma = ', num2str(gamma),') "imageCE2.tif"'])

figure
subplot(2,2,1)
imshow(ce3)
title('imageCE3.tif')
subplot(2,2,2)
bar(imhist(ce3))
title('imhist of "imageCE3.tif"')
subplot(2,2,3)
imshow(ce3_gc_1)
title(['Gamma Corrected (\gamma = ', num2str(gamma), ') imageCE3.tif'])
subplot(2,2,4)
bar(imhist(ce3_gc_1))
title(['imhist of Gamma Corrected (\gamma = ', num2str(gamma),') "imageCE3.tif"'])

figure
subplot(2,2,1)
imshow(ce4)
title('imageCE4.tif')
subplot(2,2,2)
bar(imhist(ce4))
title('imhist of "imageCE4.tif"')
subplot(2,2,3)
imshow(ce4_gc_1)
title(['Gamma Corrected (\gamma = ', num2str(gamma), ') imageCE4.tif'])
subplot(2,2,4)
bar(imhist(ce4_gc_1))
title(['imhist of Gamma Corrected (\gamma = ', num2str(gamma),') "imageCE4.tif"'])


%% Gamma Correction (gamma = 1.3)

gamma = 1.3;

ce1_gc_2 = imadjust(ce1,[],[],gamma);
ce2_gc_2 = imadjust(ce2,[],[],gamma);
ce3_gc_2 = imadjust(ce3,[],[],gamma);
ce4_gc_2 = imadjust(ce4,[],[],gamma);

figure
subplot(2,2,1)
imshow(ce1)
title('imageCE1.tif')
subplot(2,2,2)
bar(imhist(ce1))
title('imhist of "imageCE1.tif"')
subplot(2,2,3)
imshow(ce1_gc_2)
title(['Gamma Corrected (\gamma = ', num2str(gamma), ') imageCE1.tif'])
subplot(2,2,4)
bar(imhist(ce1_gc_2))
title(['imhist of Gamma Corrected (\gamma = ', num2str(gamma),') "imageCE1.tif"'])

figure
subplot(2,2,1)
imshow(ce2)
title('imageCE2.tif')
subplot(2,2,2)
bar(imhist(ce2))
title('imhist of "imageCE2.tif"')
subplot(2,2,3)
imshow(ce2_gc_2)
title(['Gamma Corrected (\gamma = ', num2str(gamma), ') imageCE2.tif'])
subplot(2,2,4)
bar(imhist(ce2_gc_2))
title(['imhist of Gamma Corrected (\gamma = ', num2str(gamma),') "imageCE2.tif"'])

figure
subplot(2,2,1)
imshow(ce3)
title('imageCE3.tif')
subplot(2,2,2)
bar(imhist(ce3))
title('imhist of "imageCE3.tif"')
subplot(2,2,3)
imshow(ce3_gc_2)
title(['Gamma Corrected (\gamma = ', num2str(gamma), ') imageCE3.tif'])
subplot(2,2,4)
bar(imhist(ce3_gc_2))
title(['imhist of Gamma Corrected (\gamma = ', num2str(gamma),') "imageCE3.tif"'])

figure
subplot(2,2,1)
imshow(ce4)
title('imageCE4.tif')
subplot(2,2,2)
bar(imhist(ce4))
title('imhist of "imageCE4.tif"')
subplot(2,2,3)
imshow(ce4_gc_2)
title(['Gamma Corrected (\gamma = ', num2str(gamma), ') imageCE4.tif'])
subplot(2,2,4)
bar(imhist(ce4_gc_2))
title(['imhist of Gamma Corrected (\gamma = ', num2str(gamma),') "imageCE4.tif"'])

%% All graphs combined

figure
subplot(3,2,1)
imshow(ce1)
title('imageCE1.tif')
subplot(3,2,2)
bar(imhist(ce1))
title('imhist of "imageCE1.tif"')
subplot(3,2,3)
imshow(ce1_gc_1)
title('Gamma Corrected (\gamma = 0.7) imageCE1.tif')
subplot(3,2,4)
bar(imhist(ce1_gc_1))
title('imhist of Gamma Corrected (\gamma = 0.7) "imageCE1.tif"')
subplot(3,2,5)
imshow(ce1_gc_2)
title('Gamma Corrected (\gamma = 1.3) imageCE1.tif')
subplot(3,2,6)
bar(imhist(ce1_gc_2))
title('imhist of Gamma Corrected (\gamma = 1.3) "imageCE1.tif"')

figure
subplot(3,2,1)
imshow(ce2)
title('imageCE2.tif')
subplot(3,2,2)
bar(imhist(ce2))
title('imhist of "imageCE2.tif"')
subplot(3,2,3)
imshow(ce2_gc_1)
title('Gamma Corrected (\gamma = 0.7) imageCE2.tif')
subplot(3,2,4)
bar(imhist(ce2_gc_1))
title('imhist of Gamma Corrected (\gamma = 0.7) "imageCE2.tif"')
subplot(3,2,5)
imshow(ce2_gc_2)
title('Gamma Corrected (\gamma = 1.3) imageCE2.tif')
subplot(3,2,6)
bar(imhist(ce2_gc_2))
title('imhist of Gamma Corrected (\gamma = 1.3) "imageCE2.tif"')

figure
subplot(3,2,1)
imshow(ce3)
title('imageCE3.tif')
subplot(3,2,2)
bar(imhist(ce3))
title('imhist of "imageCE3.tif"')
subplot(3,2,3)
imshow(ce3_gc_1)
title('Gamma Corrected (\gamma = 0.7) imageCE3.tif')
subplot(3,2,4)
bar(imhist(ce3_gc_1))
title('imhist of Gamma Corrected (\gamma = 0.7) "imageCE3.tif"')
subplot(3,2,5)
imshow(ce3_gc_2)
title('Gamma Corrected (\gamma = 1.3) imageCE3.tif')
subplot(3,2,6)
bar(imhist(ce3_gc_2))
title('imhist of Gamma Corrected (\gamma = 1.3) "imageCE3.tif"')

figure
subplot(3,2,1)
imshow(ce4)
title('imageCE4.tif')
subplot(3,2,2)
bar(imhist(ce4))
title('imhist of "imageCE4.tif"')
subplot(3,2,3)
imshow(ce4_gc_1)
title('Gamma Corrected (\gamma = 0.7) imageCE4.tif')
subplot(3,2,4)
bar(imhist(ce4_gc_1))
title('imhist of Gamma Corrected (\gamma = 0.7) "imageCE4.tif"')
subplot(3,2,5)
imshow(ce4_gc_2)
title('Gamma Corrected (\gamma = 1.3) imageCE4.tif')
subplot(3,2,6)
bar(imhist(ce4_gc_2))
title('imhist of Gamma Corrected (\gamma = 1.3) "imageCE4.tif"')