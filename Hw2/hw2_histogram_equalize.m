img = imread('tire.tif');

result = histogramEqualization(img);

imwrite(result,'tire_histeq.png');