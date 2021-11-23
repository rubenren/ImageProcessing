function outImg = histogramEqualization(img)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

outImg = zeros(size(img),'uint8');

rows = size(img,1);
cols = size(img,2);

counts = zeros(1,256,'uint32');

for r = 1:rows
    for c = 1:cols
        counts(img(r,c) + 1) = counts(img(r,c) + 1) + 1;
    end
end

probs = zeros(1,256,'double');

for i = 1:256
    probs(i) = cast(counts(i),'double')/(rows * cols);
end

iMap = zeros(1,256,'double');

for i = 1:256
    for t = 1:i
        iMap(i) = iMap(i) + probs(t);
    end
end

iMap = round(iMap * 255);

for r = 1:rows
    for c = 1:cols
        outImg(r,c) = iMap(img(r,c) + 1);
    end
end

end

