% 2 IMPLEMENTING IMAGE TRANSFORMS
% Task 1

function TransformedImage = TransformingImages_Q2_1(InputImage, TransformMatrix, TransformType)
    % Convert the input image to grayscale if it is not already
    if size(InputImage, 3) == 3
        InputImage = rgb2gray(InputImage);
    end
    
    % Output image size
    Hout = 1920; % Height of the output image
    Wout = 1080; % Width of the output image

    % Depending on the TransformType, set up the inverse transform matrix
    if strcmp(TransformType, 'affine') || strcmp(TransformType, 'homography')
        % For affine and homography transforms, calculate the inverse
        A_inv = inv(TransformMatrix);
    else
        % For other transforms, set up the inverse transform matrix manually
        switch TransformType
            case 'scaling'
                % Assuming TransformMatrix is set up as a scaling matrix
                A_inv = diag([1/TransformMatrix(1,1), 1/TransformMatrix(2,2), 1]);
            case 'rotation'
                % Assuming TransformMatrix is set up as a rotation matrix
                A_inv = TransformMatrix';
            case 'translation'
                % Assuming TransformMatrix is set up as a translation matrix
                A_inv = [1 0 -TransformMatrix(1,3); 0 1 -TransformMatrix(2,3); 0 0 1];
            case 'reflection'
                % Assuming TransformMatrix is a reflection matrix
                A_inv = TransformMatrix;
            case 'shear'
                % For shear, the inverse would need to be calculated based on the specific shear matrix
                % This is a placeholder for the actual inverse shear matrix calculation
                A_inv = inv(TransformMatrix); % Replace with actual calculation
            otherwise
                error('Unsupported TransformType');
        end
    end

    % Initialize the output image
    TransformedImage = zeros(Hout, Wout, 'uint8');

    % Apply the inverse transformation to each pixel in the output image
    for x_prime = 1:Wout
        for y_prime = 1:Hout
            % Apply the inverse transform to find the corresponding coordinates in the input image
            input_coords = A_inv * [x_prime; y_prime; 1];
            
            % Get the coordinates (x, y) using homogeneous coordinates
            x = input_coords(1) / input_coords(3);
            y = input_coords(2) / input_coords(3);
            
            % Interpolate the pixel value
            TransformedImage(y_prime, x_prime) = interpolate(InputImage, x, y);
        end
    end
    % Plot the output image
%     figure;
%     imshow(TransformedImage);
%     title('Transformed Image');

    % Save the transformed image
    imwrite(TransformedImage, 'TransformedImage.png');
end

function pixelValue = interpolate(image, x, y)
    % Check the boundaries of x and y
    if x < 1 || x > size(image, 2) || y < 1 || y > size(image, 1)
        % If the point is outside the image boundaries, return a pixelValue of 0
        pixelValue = uint8(0);
    else
        % Perform bilinear interpolation
        x1 = floor(x);
        x2 = ceil(x);
        y1 = floor(y);
        y2 = ceil(y);

        % Get the four nearest pixel values
        Q11 = double(image(y1, x1));
        Q12 = double(image(y1, x2));
        Q21 = double(image(y2, x1));
        Q22 = double(image(y2, x2));

        % If the point is exactly at a pixel coordinate, return that pixel value
        if x == x1 && y == y1
            pixelValue = uint8(Q11);
        elseif x == x1 && y == y2
            pixelValue = uint8(Q21);
        elseif x == x2 && y == y1
            pixelValue = uint8(Q12);
        elseif x == x2 && y == y2
            pixelValue = uint8(Q22);
        else
            % Calculate the interpolated pixel value
            fxy1 = ((x2 - x) / (x2 - x1)) * Q11 + ((x - x1) / (x2 - x1)) * Q12;
            fxy2 = ((x2 - x) / (x2 - x1)) * Q21 + ((x - x1) / (x2 - x1)) * Q22;
            pixelValue = ((y2 - y) / (y2 - y1)) * fxy1 + ((y - y1) / (y2 - y1)) * fxy2;
        end
        
        % Clamp the value to the 0-255 range and convert to uint8
        pixelValue = uint8(min(max(round(pixelValue), 0), 255));
    end
end

