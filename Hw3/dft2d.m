function outputArray = dft2d(inputArray)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    inputArray = double(inputArray);
    pixel = complex(0,0);
    outputArray = zeros(size(inputArray),'like',pixel);

    rows = size(inputArray,1);
    cols = size(inputArray,2);
    
    for u = 1:rows
        for v = 1:cols
            pixel = complex(0,0);
            for x = 1:rows
                for y = 1:cols
                    pixel = pixel + inputArray(x,y) * ...
                        exp(-1j*2*pi*((u - 1)*(x - 1)/rows + ...
                        (v - 1)*(y - 1)/cols));
                end
            end
            outputArray(u,v) = pixel;
        end
    end
end

