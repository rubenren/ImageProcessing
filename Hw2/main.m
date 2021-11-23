display('Problem 1a.i:');
display('First step is to convert the numbers to binary values, then bitwise or the resulting numbers with the corresponding values from the represented bit planes. (i.e. 1,10,100,1000,10000,etc.)');

display('Problem 1a.ii:');
display('0001');
display([0 1 0 0; 0 0 1 1; 1 1 0 0; 1 0 1 0]);
display('0010');
display([0 0 0 1; 1 1 0 0; 0 1 1 0; 1 1 1 1]);
display('0100');
display([0 0 0 1; 0 0 0 0; 0 1 1 0; 0 1 0 0]);
display('1000');
display([0 0 1 0; 0 0 0 0; 0 1 1 1; 0 0 1 1]);

display('Problem 1b:');
display('please see report for the charts');

display('Problem 1c:');
display('From our equation we see that for every value ofrkwe are summing all of the previousvalues  of rk with  the  current  value  of rk,  therefore  we  cannot  ever  be  decreasing  thus satisfying both of the conditions that the function should be increasing.');

display('Problem 1d:');
display('The conditions that are meant to be imposed on f(x, y) and g(x, y) are that the pixel intensity values are to be in the range of 0≤r≤(L−1)');

display('Problem 1e:');
display('I would create an image that is completely zeroed out, with a single 1 in the middle. I would then give the chip a particular filter, and check which orientation the resulting operation would create, if the result is the same orientation as the filter, then the chip would be performing convolution.');

display('Problem 1f.i:');
display([ 16 16 16; 16 16 16; 16 16 16]);

display('Problem 1f.ii:');
display('no');

display('Problem 1g:');
display('the reason is because the kernel for image b has a size that is a power of the sizes of the vertical  bars. as  the  kernel  slides  along  the  bars,  there  is  always  a  constant  number  of bar pixels, which results in that region being a constant intensity, because the operationis using the same number of bar pixels for every coordinate.');

display('Problem 2a:');
hw2_piecewise_linear;

display('Problem 2b:');
hw2_histogram_equalize;

display('Problem 2c:');
hw2_sharpen;

display('Problem 2d:');
hw2_gradient_magnitude;