% Read the input image
InputImage = imread('Image1.png');

% Convert the color image to grayscale if it is not already
if size(InputImage, 3) == 3
    InputImage = rgb2gray(InputImage);
end

% Define the shear matrix for shearing in the x-direction
shear_factor = 0.5;
ShearMatrix = [1 shear_factor 0; 0 1 0; 0 0 1];

% Create the affine2d object for the shearing transformation
tform = affine2d(ShearMatrix);

% Apply the shearing transformation using imwarp
% Note: We're setting 'OutputView' to match the input image size for simplicity.
% Depending on the shear factor, some parts of the image might be clipped or the image
% might need padding. Adjust 'OutputView' accordingly if needed.
ShearedImage = imwarp(InputImage, tform, 'OutputView', imref2d(size(InputImage)));

% Display the original and sheared images
imshow(InputImage);
title('Original Image');
figure;
imshow(ShearedImage);
title('Sheared Image in the X-direction');

% Save the sheared image
imwrite(ShearedImage, 'ShearedImage.png');
