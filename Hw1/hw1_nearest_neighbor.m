img = imread("coins.png");
rows = size(img,1);
cols = size(img,2);
mat = rotateAboutCenterTransformation(cols, rows, -pi/6);
imwrite(transformImageNearestNeighbor(img,mat),"coins_nearest_neighbor_rot330.png");

mat = rotateAboutCenterTransformation(cols, rows, pi/4);
imwrite(transformImageNearestNeighbor(img,mat),"coins_nearest_neighbor_rot45.png");

mat = rotateAboutCenterTransformation(cols, rows, pi/2);
imwrite(transformImageNearestNeighbor(img,mat),"coins_nearest_neighbor_rot90.png");