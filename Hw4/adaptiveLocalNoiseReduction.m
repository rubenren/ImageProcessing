function restoredImg = adaptiveLocalNoiseReduction(img, variance, window_size)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    % Change image to doubles
    img = double(img);

    % Initialize the mean and variance matrix
    loc_mean = zeros(size(img));
    loc_var = zeros(size(img));
    
    % Initialize restored image
    restoredImg = zeros(size(img));

    % Grab the height and width of the image
    rows = size(img,1);
    cols = size(img,2);

    % Set up the radius of the window
    w_radius = (window_size - 1) / 2;
    
    % Pad the image with zeros
    % First pad top and bottom
    imgP = [zeros(w_radius, cols); img; zeros(w_radius, cols)];
    % Then pad left and right
    imgP = [zeros(2*w_radius + rows, w_radius) imgP zeros(2*w_radius + rows, w_radius)];
    
    % Calculate the local mean and variance matrix
    for r = 1:rows
        for c = 1:cols
            loc_window = imgP(r:2*w_radius + r, c:2*w_radius + c);
            loc_mean(r,c) = mean(loc_window, 'all');
            
            % Enforce assumption of var_n <= var_window
            if variance > var(loc_window, 0, 'all')
                loc_var(r,c) = variance;
            else
                loc_var(r,c) = var(loc_window, 0, 'all');
            end
        end
    end
    
    % Populate the restored image using the equation
    for r = 1:rows
        for c = 1:cols
            restoredImg(r,c) = img(r,c) - (variance/loc_var(r,c)) * (img(r,c) - loc_mean(r,c));
        end
    end

    % Change result to B/W image
    % restoredImg = uint8(restoredImg);
    
end

