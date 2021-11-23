img = imread('cameraman.tif');
%img = cast(img,'double')/255;
wv = 'sym4';

%prevmode = dwtmode;
%dwtmode('per');

[aDec1, hDec1, vDec1, dDec1] = dwt2(img,wv);
[aDec2, hDec2, vDec2, dDec2] = dwt2(aDec1,wv);
[aDec3, hDec3, vDec3, dDec3] = dwt2(aDec2,wv);
[aDec4, hDec4, vDec4, dDec4] = dwt2(aDec3,wv);

aDec1 = zeros(size(aDec1),'like',aDec1);
aDec2 = zeros(size(aDec2),'like',aDec2);
aDec3 = zeros(size(aDec3),'like',aDec3);
aDec4 = zeros(size(aDec4),'like',aDec4);

% Reconstruction from 1-scale
rec1 = cast(idwt2(aDec1, hDec1, vDec1, dDec1, wv),'uint8');

% Reconstruction from 2-scale
midADec1 = idwt2(aDec2, hDec2, vDec2, dDec2, wv);
rec2 = cast(idwt2(midADec1, hDec1, vDec1, dDec1, wv),'uint8');

% Reconstruction from 3-scale
midADec2 = idwt2(aDec3, hDec3, vDec3, dDec3, wv);
midADec1 = idwt2(midADec2, hDec2, vDec2, dDec2, wv);
rec3 = cast(idwt2(midADec1, hDec1, vDec1, dDec1, wv),'uint8');

% Reconstruction from 4-scale
midADec3 = idwt2(aDec4, hDec4, vDec4, dDec4, wv);
midADec2 = idwt2(midADec3, hDec3, vDec3, dDec3, wv);
midADec1 = idwt2(midADec2, hDec2, vDec2, dDec2, wv);
rec4 = cast(idwt2(midADec1, hDec1, vDec1, dDec1, wv),'uint8');

figure, imshow(img), colorbar;
figure, imshow(rec1), colorbar;
figure, imshow(rec2), colorbar;
figure, imshow(rec3), colorbar;
figure, imshow(rec4), colorbar;

%dwtmode(prevmode);