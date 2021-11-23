display('Problem 1a.i:');
display('The reason why is because the underlying formula of the geometric mean seems to differ around edges more than the arithmetic mean does. In a simple calculation of a 1-D series of numbers, the zeros tend to persist way more in the geometric mean than in the arithmetic mean.');

display('Problem 1a.ii:');
display('The reason the black components are thicker in the geometric mean is because the geometric mean multiplies all of the underlying elements by each other, this results in zeros sort of "infesting" other pixels, which causes thicker dark areas.');

display('Problem 1b:');
display('The reason why this is the case is because the linear smoothing filters will not maintain the difference between pixels across edges, it tends to make the changes in the pixels take a gradual change, while for the median filters, it maintains the sudden change across edges and has no gradual change effect.');

display('Problem 1c:');
display('If you include completely white and completely black as gray, then there are 256 different possible shades of gray, if you do not include those, then there are 254 different shades.');

display('Problem 2a:');
spatial_image_restoration;

display('Problem 2b:');
hw4_inverse_filter;

display('Problem 2c:');
hw4_rgb_histeq1;
hw4_rgb_histeq2;