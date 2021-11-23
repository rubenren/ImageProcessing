display('Problem 10.6:');
display('The horizontal angle corresponding with Fig. 10.6(a) would be an angle measurement of 90. The vertical angle corresponding with Fig. 10.6(c) would be an angle measurement of 0.');

display('Problem 10.10:');
display('This is a drawing with an example of a kernel of size 3x3, the point is that the intensity values will blend across the edge, no matter the size of the kernel.');

display('Problem 10.26:');
display('The reason we chose these values was because small gaussian blurring filters are decently approximated by box filters, so we make them larger, and according to the text, any size larger than 6 times the standard deviation is needless.');

display('Problem 10.41:');
display('There are a few ways to accomplish this, the way that I will propose is to use a blurring filter first, and then execute a thresholding algorithm with the threshold in between the two original values of 170 and 60, which would be 115.');

hw7_canny;

hw7_kmeans;