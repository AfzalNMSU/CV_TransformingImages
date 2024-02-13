% 1 COMPUTING THE INVERSE TRANSFORM MATRIX
% Task 4

% Define the shear factor along the x-direction
shear_factor_x = 2;

% Define the shear matrix along the x-direction
Sx = [1 shear_factor_x;
      0 1];

% Calculate the determinant of the shear matrix
det_Sx = Sx(1,1) * Sx(2,2) - Sx(1,2) * Sx(2,1);

% Check if the determinant is zero (if it is, the matrix is singular and cannot be inverted)
if det_Sx == 0
    error('Matrix is singular and cannot be inverted');
end

% Calculate the inverse of the shear matrix using the provided formula
Sx_inv = (1 / det_Sx) * [Sx(2,2) -Sx(1,2);
                          -Sx(2,1) Sx(1,1)];

% Display the shear matrix and its inverse
disp('Shear Matrix along x-direction:');
disp(Sx);
disp('Inverse Shear Matrix along x-direction:');
disp(Sx_inv);
