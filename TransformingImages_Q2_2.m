% 2 IMPLEMENTING IMAGE TRANSFORMS
% Task 2

% Read the input image
InputImage = imread('Image1.png');

% Convert the color image to grayscale (if necessary)
grayImage = rgb2gray(InputImage);

% Define the transformation matrix for reflection in the y-direction
TransformMatrix = [-1 0 0; 0 1 0; size(grayImage, 2) 0 1];

% Create the affine2d object
tform = affine2d(TransformMatrix);

% Apply the transformation using imwarp
ReflectedImage = imwarp(grayImage, tform, 'OutputView', imref2d(size(grayImage)));

% Display the original and reflected images
% imshow(InputImage);
% figure;
% imshow(ReflectedImage);

% Save the reflected image
imwrite(ReflectedImage, 'ReflectedImage.png');
