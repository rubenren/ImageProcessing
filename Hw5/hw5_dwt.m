img = imread('cameraman.tif');
img = cast(img,'double')/255;

wavelet = 'haar';

[cfs,inds] = wavedec2(img, 3, wavelet);

cfs1 = appcoef2(cfs,inds,wavelet,1);
[H1,V1,D1] = detcoef2('a',cfs,inds,1);
cfs2 = appcoef2(cfs,inds,wavelet,2);
[H2,V2,D2] = detcoef2('a',cfs,inds,2);
cfs3 = appcoef2(cfs,inds,wavelet,3);
[H3,V3,D3] = detcoef2('a',cfs,inds,3);

H1 = H1 ./ (2 * abs(max(H1,[],'all'))) + .5;
V1 = V1 ./ (2 * abs(max(V1,[],'all'))) + .5;
D1 = D1 ./ (2 * abs(max(D1,[],'all'))) + .5;

H2 = H2 ./ (2 * abs(max(H2,[],'all'))) + .5;
V2 = V2 ./ (2 * abs(max(V2,[],'all'))) + .5;
D2 = D2 ./ (2 * abs(max(D2,[],'all'))) + .5;

H3 = H3 ./ (2 * abs(max(H3,[],'all'))) + .5;
V3 = V3 ./ (2 * abs(max(V3,[],'all'))) + .5;
D3 = D3 ./ (2 * abs(max(D3,[],'all'))) + .5;

sub3 = [cfs3/8 H3; V3 D3];
sub2 = [sub3 H2; V2 D2];

decImg = [sub2 H1; V1 D1];

cfs2Img = cast((cfs2 / 4) * 255, 'uint8');

cfs1Img = cast((cfs1 / 2) * 255, 'uint8');

figure, imshow(cfs2Img);
imwrite(cfs2Img,'cameraman_A2.png');

figure, imshow(cfs1Img);
imwrite(cfs1Img,'cameraman_A1.png');

figure, imshow(decImg);