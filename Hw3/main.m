display('Problem 1a:');
display('See pdf.');

display('Problem 1b:');
display('Since from the hint we know that the tent function can be obtained by convolving two equal box functions in non-Fourier space, all we have to do is do the equivalent operation in Fourier space (in this case, convolving in non-Fourier space is equivalent to element by element multiplication in Fourier space). Therefore, we can essentially just square the Fourier transform of a box function to obtain a “tent” function in Fourier space.');

display('Problem 1c.i:');
display('See pdf.');

display('Problem 1c.ii:');
display('The sampling rate appeares to be around 1 sample per 2.2 units.');

display('Problem 1c.iii:');
display('The sampling rate I would use to meet both of these conditions is probably 2 samples every unit, or 1 sample for every 0.5 units. The reason why is because this would be the sampling rate that would catch the full sin wave, alternating between the peaks and the crossing axes.');

display('Problem 1d:');
display('Images that would not be affected by aliasing would be images that have no repeating patterns within them. An example of this would be a photograph of single balloon with a background of a blue sky.');

disaply('Problem 1e:');
display('Since the term seems to be dividing the resulting value for every pixel slot by MN, I believe that if the terms are in the DFT and not the IDFT, then the resulting image in the frequency domain will be dimmer than, if the terms were in front of the IDFT instead. Where if they were in front of the IDFT, the frequency domain image would be brighter, and if they were split evenly, then the intensity of the image in the frequency domain would be an average brightness level.');

display('Problem 1f.i-ii:');
display('See pdf.');

display('Problem 1g:');
display('No, the reason is because the transform into the frequency domain is invariant to positional transformations, and this is pretty much just a transformation from the top left of the image to the center of the image.');


display('Problem 2a:');
testInput = ones(100);
tic;
dft2d(testInput);
display('time = ');
display(toc);

hw3_dft_ift;

display('Problem 2b:');
hw3_convtheorem;

display('Problem 2c.i-ii:');
hw3_lpf;