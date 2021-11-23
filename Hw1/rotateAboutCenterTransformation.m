function matrix = rotateAboutCenterTransformation(width,height,rotAngle)
    transform = [1 0 -(height + 1)/2; 0 1 -(width + 1)/2; 0 0 1];
    rotation = [cos(rotAngle) -sin(rotAngle) 0; sin(rotAngle) cos(rotAngle) 0; 0 0 1];
    matrix = transform \ rotation * transform;
end

