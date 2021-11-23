function outImg = sharpen(img)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here

der2w = [0 -1 0; -1 4 -1; 0 -1 0];

lapImg = conv2(img,der2w,'same');

outImg = cast(img,'double') + lapImg;

end

