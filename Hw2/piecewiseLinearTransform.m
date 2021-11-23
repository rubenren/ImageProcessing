function outImg = piecewiseLinearTransform(img,inIs,outIs)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
outImg = zeros(size(img),'uint8');
rows = size(img,1);
cols = size(img,2);

for r = 1:rows
    for c = 1:cols
        value = cast(img(r,c),'double');
        if value <= inIs{2}
            value = (value - inIs{1})*(outIs{2} - outIs{1})/(inIs{2}-inIs{1}) + outIs{1};
        elseif value > inIs{2} && value <= inIs{3}
            value = (value - inIs{2}) * (outIs{3} - outIs{2})/(inIs{3}-inIs{2}) + outIs{2};
        elseif value > inIs{3}
            value = (value - inIs{3}) * (outIs{4} - outIs{3})/(inIs{4}-inIs{3}) + outIs{3};
        end
        outImg(r,c) = round(value);
    end
end

end

