% 2 IMPLEMENTING IMAGE TRANSFORMS
% Task 6

% Read the input image
InputImage = imread('Image1.png');


% Convert the color image to grayscale if it is not already
if size(InputImage, 3) == 3
    InputImage = rgb2gray(InputImage);
end

% Define the first affine transformation matrix
A1 = [1 0.4; 0.1 1];

% Define the translation component for the first transformation
t1 = [0.4; 0.3];

% Define the second affine transformation matrix
A2 = [2.1 -0.35; -0.3 0.7];

% Define the translation component for the second transformation
t2 = [-0.1; 0.3];

% Combine the affine transformation matrices
CombinedMatrix = A2 * A1;

% Combine the translation components
CombinedTranslation = t2 + A2 * t1;

% Construct the combined transformation matrix with translation
CombinedMatrixWithTranslation = [CombinedMatrix, CombinedTranslation; 0 0 1];

% Create the affine2d object for the combined affine transformation
tform = affine2d(CombinedMatrixWithTranslation');

% Apply the combined affine transformation using imwarp
outputRef = imref2d(size(InputImage));
TransformedImage = imwarp(InputImage, tform, 'OutputView', outputRef);

% Display the original and transformed images
imshow(InputImage);
title('Original Image');
figure;
imshow(TransformedImage);
title('Transformed Image with Combined Affine Transform');

% Save the transformed image
imwrite(TransformedImage, 'Q2_6_CombinedAffineTransformedImage.png');
