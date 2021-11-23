inputImg = imread('autumn.tif');

outImg = zeros(size(inputImg));

outImg(:,:,1) = histeq(inputImg(:,:,1));
outImg(:,:,2) = histeq(inputImg(:,:,2));
outImg(:,:,3) = histeq(inputImg(:,:,3));

subplot(1,2,1), imshow(inputImg);
subplot(1,2,2), imshow(outImg);

imwrite(outImg, 'autumn_histeq1.png');