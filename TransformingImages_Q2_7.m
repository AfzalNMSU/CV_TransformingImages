% 2 IMPLEMENTING IMAGE TRANSFORMS
% Task 7

% Read the input image
InputImage = imread('Image1.png');

% Convert the color image to grayscale if it is not already
if size(InputImage, 3) == 3
    InputImage = rgb2gray(InputImage);
end

% Define the first homography matrix
H1 = [.8 .2 .3; -.1 .9 -.1; .0005 -.0005 1];

% Define the second homography matrix
H2 = [29.25 13.95 20.25; 4.95 35.55 9.45; 0.045 0.09 45];

% Combine the homography matrices
% The multiplication order here is important and assumes H1 is applied first, then H2.
CombinedMatrix = H2 * H1; 

% Create the projective2d object for the combined homography
tform = projective2d(CombinedMatrix');

% Apply the combined homography transformation using imwarp
TransformedImage = imwarp(InputImage, tform);

% Display the original and transformed images
imshow(InputImage);
title('Original Image');
figure;
imshow(TransformedImage);
title('Transformed Image with Combined Homography');

% Save the transformed image
imwrite(TransformedImage, 'Q2_7_CombinedHomographyTransformedImage.png');
