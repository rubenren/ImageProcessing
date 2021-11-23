img = imread('moon.tif');

sharp = sharpen(img);

imshow(sharp,[0 255]);