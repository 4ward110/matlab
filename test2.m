im = imread('flower.jpg');
im = imresize(im, [320 NaN]);
im = rgb2gray(im)
h = imshow(im)
imattributes(h)
size(im)
