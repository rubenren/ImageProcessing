inputImg = imread('cameraman.tif');

% Changing image to range [0, 1]
midImg = double(inputImg);
midImg = rescale(midImg,0,1);

noisyImg = imnoise(midImg, 'gaussian', 0, .1);

estImg = adaptiveLocalNoiseReduction(noisyImg, .1, 7);

subplot(1,3,1);
imshow(inputImg);
subplot(1,3,2);
imshow(noisyImg);
subplot(1,3,3);
imshow(estImg);