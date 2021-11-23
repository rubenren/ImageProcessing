function hsiImg = rgb2hsi(rgbImg)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

    rgbImg = double(rgbImg);
    
    rgbImg = rescale(rgbImg);
    
    hsiImg = zeros(size(rgbImg));
    
    red = rgbImg(:,:,1);
    green = rgbImg(:,:,2);
    blue = rgbImg(:,:,3);

    % Getting theta for H
    numerator = .5 * ((red - green) + (red - blue));
    denom = sqrt((red - green).^2 + (red - blue) .* (green - blue));
    
    denom(denom == 0) = .00001;
    
    theta = acosd(numerator./denom);
    
    % Calculate hue
    hue = theta;
    hue(blue > green) = 360 - hue(blue > green);
    
    % Normalize the hue
    % normHue = hue/360;
    
    % Get saturation
    sat = 1 - 3 .* min(min(red,green),blue) ./ (red + green + blue);
    
    % get intensity
    intens = (red + green + blue)/3;
    
    hsiImg(:,:,1) = hue;
    hsiImg(:,:,2) = sat;
    hsiImg(:,:,3) = intens;

end

