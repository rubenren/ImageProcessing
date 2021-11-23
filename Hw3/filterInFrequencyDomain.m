function filteredOutput = filterInFrequencyDomain(img,kernel)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

    img = double(img);
    kernel = double(kernel);

    imgRows = size(img,1);
    imgCols = size(img,2);
    
    kernelRows = size(kernel,1);
    kernelCols = size(kernel,2);
    
    P = imgRows + kernelRows;
    Q = imgCols + kernelCols;
    
    imgP = [img; zeros(P - imgRows,imgCols)];
    imgP = [imgP zeros(P,Q - imgCols)];
    
    kernelP = [kernel; zeros(P - kernelRows,kernelCols)];
    kernelP = [kernelP zeros(P,Q - kernelCols)];
    
    F = fft2(imgP);
    H = fft2(kernelP);
    
    G = H .* F;
    
    gP = real(ifft2(G));
    
    filteredOutput = uint8(gP(1:imgRows,1:imgCols));
    
end

