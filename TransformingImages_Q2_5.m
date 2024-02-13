% Read the input image
InputImage = imread('Image1.png');

% Define the transformation parameters
translate_x = 300;
translate_y = 500;
theta_deg = -20; % Negative for counterclockwise rotation
scale_factor = 0.5;

% Define individual transformation matrices
T = [1 0 translate_x; 0 1 translate_y; 0 0 1];
theta_rad = deg2rad(theta_deg);
R = [cos(theta_rad) -sin(theta_rad) 0; sin(theta_rad) cos(theta_rad) 0; 0 0 1];
S = [scale_factor 0 0; 0 scale_factor 0; 0 0 1];

% Combine the transformation matrices
CombinedMatrix = S * R * T;

% Call the transformImage function with the combined matrix
TransformedImage = TransformingImages_Q2_1(InputImage, CombinedMatrix, 'affine');

% Display and save the transformed image
imshow(TransformedImage);
imwrite(TransformedImage, 'Q2_5_CombinedTransformedImage.png');
