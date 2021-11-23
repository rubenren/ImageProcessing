function transformedImg = transformImageLinear(img,transform)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    transformedImg = zeros(size(img),'uint8');
    rows = size(img,1);
    cols = size(img,2);
    for r = 1:rows
        for c = 1:cols
            point = transform\[r;c;1];
            
            if floor(point(1)) < 1 || floor(point(2)) < 1 || ceil(point(1)) > rows || ceil(point(2)) > cols
                continue;
            end
            
            x = point(2);
            y = point(1);
            
            x0 = floor(point(2)); %column is x
            x1 = x0 + 1;
            
            y0 = floor(point(1)); %row is y
            y1 = y0 + 1;
            
            a = (x1 - x)*img(floor(y), floor(x)) + (x - x0)*img(floor(y), ceil(x));
            b = (x1 - x)*img(ceil(y), floor(x)) + (x - x0)*img(ceil(y), ceil(x));
            
            value = (y1-y)*a + (y-y0)*b;
            transformedImg(r,c) = value;
        end
    end
end