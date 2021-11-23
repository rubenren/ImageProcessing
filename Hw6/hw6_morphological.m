img = double(imread('text.tif'));


thinned = imerode(img, strel('diamond',1));

figure, subplot(1,2,1), imshow(thinned);
subplot(1,2,2), imshow(img);