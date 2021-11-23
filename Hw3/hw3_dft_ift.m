inputImage = imread('cameraman.tif');
FDFT = dft2d(inputImage);
FDFT = fftshift(FDFT);
magF = abs(FDFT);
phaseF = angle(FDFT);
GDFT = magF .* exp(1j * phaseF);
GDFT = ifftshift(GDFT);
g = ifft2(GDFT);
outputImage = cast(real(g),'uint8');
imwrite(outputImage,'cameraman_dft_ift.png');

figure, imshow(log(magF),'DisplayRange',[]), colorbar;
figure, imshow(phaseF,'DisplayRange',[]), colorbar;