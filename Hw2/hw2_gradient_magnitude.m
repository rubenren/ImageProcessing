img = imread('circuit.tif');

result = gradientMagnitude(img);

imshow(result,[0 255]);