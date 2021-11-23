function transformedImg = transformImageNearestNeighbor(img,transform)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    transformedImg = zeros(size(img),'uint8');
    rows = size(img,1);
    cols = size(img,2);
    for r = 1:rows
        for c = 1:cols
            point = transform\[r;c;1];
            if round(point(1)) < 1 || round(point(2)) < 1 || round(point(1)) > rows || round(point(2)) > cols
                continue;
            end
            point(3) = [];
            point = [round(point(1)) round(point(2))];
            value = uint8(img(point(1),point(2)));
            transformedImg(r,c) = value;
        end
    end
end

