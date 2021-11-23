function magImg = gradientMagnitude(img)
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here

ddx = [-1 -2 -1; 0 0 0; 1 2 1];
ddy = [-1 0 1; -2 0 2; -1 0 1];

dfdx = conv2(img,ddx,'same');
dfdy = conv2(img,ddy,'same');

magImg = sqrt(dfdx.^2 + dfdy.^2);

end

