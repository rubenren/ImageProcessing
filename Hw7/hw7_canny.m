img = imread("coins.png");
img = double(img);
smoothed = imgaussfilt(img,.5);

sobelX = [-1 -2 -1; 0 0 0; 1 2 1];
sobelY = [-1 0 1; -2 0 2; -1 0 1];
partialX = imfilter(img,sobelX,'conv');
partialY = imfilter(img,sobelY,'conv');

gradientMag = sqrt(partialX.^2 + partialY.^2);

max_filtered = ordfilt2(gradientMag,9,ones(3));
mask = max_filtered ~= gradientMag;
suppressed = gradientMag;
suppressed(mask) = 0;

angleImg = atan2(partialY,partialX);

subplot(2,2,1), imshow(uint8(smoothed)), title('smoothed image'), colorbar;
subplot(2,2,2), imshow(gradientMag, []), title('gradient magnitudes'), colorbar;
subplot(2,2,3), imshow(angleImg, []), title('angle image'), colorbar;
subplot(2,2,4), imshow(suppressed, []), title('suppressed image'), colorbar;
