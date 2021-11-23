img = imread('pout.tif');

result = piecewiseLinearTransform(img,{0,70,180,255},{0,10,240,255});
imwrite(result,'pout_contrast_stretch.tif');