function rgbImg = hsi2rgb(hsiImg)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

    rgbImg = zeros(size(hsiImg));
    
    red = rgbImg(:,:,1);
    green = rgbImg(:,:,2);
    blue = rgbImg(:,:,3);
    
    hue = hsiImg(:,:,1);
    sat = hsiImg(:,:,2);
    intense = hsiImg(:,:,3);
    
    % Selection using condition 0 <= H < 120
    selection = hue >= 0 & hue < 120;
    
    % Setting blue 
    blue(selection) = intense(selection) .* (1 - sat(selection));
    % Setting red 
    red(selection) = intense(selection) .* (1 + sat(selection) .* cosd(hue(selection)) ./ cosd(60 - hue(selection)));
    % Setting green 
    green(selection) = 3 * intense(selection) - (blue(selection) + red(selection));
    
    % Selection using condition 120 <= H < 240
    selection = hue >= 120 & hue < 240;
    hue(selection) = hue(selection) - 120;
    
    % Setting red
    red(selection) = intense(selection) .* (1 - sat(selection));
    % Setting green
    green(selection) = intense(selection) .* (1 + sat(selection) .* cosd(hue(selection)) ./ cosd(60 - hue(selection)));
    % Setting blue
    blue(selection) = 3 * intense(selection) - (red(selection) + green(selection));
    
    % Selection using condition 240 <= H <= 360
    selection = hue >= 240 & hue <= 360;
    hue(selection) = hue(selection) - 240;
    
    % Setting green
    green(selection) = intense(selection) .* (1 - sat(selection));
    % Setting blue
    blue(selection) = intense(selection) .* (1 + sat(selection) .* cosd(hue(selection)) ./ cosd(60 - hue(selection)));
    % Setting red
    red(selection) = 3 * intense(selection) - (green(selection) + blue(selection));
    
    rgbImg(:,:,1) = red;
    rgbImg(:,:,2) = green;
    rgbImg(:,:,3) = blue;
    
end

