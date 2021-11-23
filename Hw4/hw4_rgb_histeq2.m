inputImg = imread('autumn.tif');

hsiImg = rgb2hsi(inputImg);

hsiImg(:,:,3) = histeq(hsiImg(:,:,3));

histEqImg = hsi2rgb(hsiImg);

histEqImg = uint8(rescale(histEqImg,0,255));

imwrite(histEqImg,'autumn_histeq2.png');

figure, imshow(inputImg);
figure, imshow(histEqImg);