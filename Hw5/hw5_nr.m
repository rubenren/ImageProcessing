img = imread('rice.png');

wv = 'sym4';
%prevmode = dwtmode;
%dwtmode('per');

[aDec1, hDec1, vDec1, dDec1] = dwt2(img,wv);
[aDec2, hDec2, vDec2, dDec2] = dwt2(aDec1,wv);

hDec1(abs(hDec1) < 20) = 0;
vDec1(abs(vDec1) < 20) = 0;
dDec1(abs(dDec1) < 20) = 0;
hDec2(abs(hDec2) < 20) = 0;
vDec2(abs(vDec2) < 20) = 0;
dDec2(abs(dDec2) < 20) = 0;

% Reconstruct image
midADec1 = idwt2(aDec2, hDec2, vDec2, dDec2, wv);
rec2 = cast(idwt2(midADec1, hDec1, vDec1, dDec1, wv),'uint8');

figure, imshow(img);
imwrite(rec2,'rice_nr.png');