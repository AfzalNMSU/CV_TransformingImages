% Read the input image
InputImage = imread('Image1.png');

% Convert the color image to grayscale (if necessary)
grayImage = rgb2gray(InputImage);

% Define the angle of rotation (30 degrees clockwise)
theta = -30;  % MATLAB's rotation is counterclockwise, hence negative for clockwise
theta_rad = deg2rad(theta); % Convert to radians

% Define the transformation matrix for rotation
cosTheta = cos(theta_rad);
sinTheta = sin(theta_rad);

% Since we want to rotate around the center, we need to adjust the transformation
% Calculate the size of the rotated image
[h, w] = size(grayImage);
diagonal = sqrt(h^2 + w^2);
new_h = ceil(diagonal);
new_w = ceil(diagonal);

% Calculate center of the original and new image
cx = w / 2;
cy = h / 2;
ncx = new_w / 2;
ncy = new_h / 2;

% Define the transformation matrix for rotation about the center
TransformMatrix = [cosTheta -sinTheta 0; sinTheta cosTheta 0; 0 0 1];

% Create an affine2d object
tform = affine2d(TransformMatrix);

% Calculate the transformation that shifts the image to the center of the new image
Ttranslate = [1 0 0; 0 1 0; (ncx-cx) (ncy-cy) 1];

% Combine the rotation and translation transformations
tform = affine2d(Ttranslate * TransformMatrix);

% Apply the transformation using imwarp
RotatedImage = imwarp(grayImage, tform, 'OutputView', imref2d([new_h new_w]));

% Display the original and rotated images
imshow(InputImage);
figure;
imshow(RotatedImage);

% Save the rotated image
imwrite(RotatedImage, 'RotatedImage.png');
