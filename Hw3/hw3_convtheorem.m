inputImg = imread('moon.tif');
Laplacian = [1 1 1; 1 -8 1; 1 1 1];

freqRes = filterInFrequencyDomain(inputImg, Laplacian);

spatialRes = imfilter(inputImg,Laplacian);

figure, imshow(freqRes,'DisplayRange',[]), colorbar;
figure, imshow(spatialRes,'DisplayRange',[]), colorbar;

% uncomment to show sharpened images
%figure, imshow(inputImg - freqRes);
%figure, imshow(inputImg - spatialRes);
%figure, imshow(inputImg);