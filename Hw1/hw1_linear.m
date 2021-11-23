img = imread("coins.png");
rows = size(img,1);
cols = size(img,2);
mat = rotateAboutCenterTransformation(cols, rows, -pi/6);
imwrite(transformImageLinear(img,mat),"coins_linear_rot330.png");

mat = rotateAboutCenterTransformation(cols, rows, pi/4);
imwrite(transformImageLinear(img,mat),"coins_linear_rot45.png");

mat = rotateAboutCenterTransformation(cols, rows, pi/2);
imwrite(transformImageLinear(img,mat),"coins_linear_rot90.png");