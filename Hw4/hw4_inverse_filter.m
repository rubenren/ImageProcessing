inStruct = load('degraded.mat');

degFunc = [3   7   7   7   8   9   5; ...
    4   6   2   5   8   8   3; ...
    8   5   4   4   6   5   8; ...
    1   5   6   5   4   6   2; ...
    1   3   8   3   8   6   3; ...
    2   7   1   5   5   2   2; ...
    6   2   9   5   4   3   3]/239;

d = inStruct.g;
d_p = inStruct.g_p;

rows = size(d,1);
cols = size(d,2);

degFuncP = padarray(degFunc, rows-1,'post');
degFuncP = padarray(degFuncP', cols-1, 'post')';

H = fft2(degFuncP);
G = fft2(d_p);
FHat = G./H;

fHatP = uint8(real(ifft2(FHat)));
fHat = fHatP(1:rows,1:cols);

figure, imshow(uint8(d));
figure, imshow(fHat);

imwrite(fHat,'./estimate.png');