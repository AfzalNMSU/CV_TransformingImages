% Define the translation vector
tx = 3; % Translation along x-axis
ty = -2; % Translation along y-axis

% Create the translation matrix
T = [1 0 tx;
     0 1 ty;
     0 0 1];

% Compute the inverse translation matrix
T_inv = [1 0 -tx;
         0 1 -ty;
         0 0 1];

% Display the translation matrix and its inverse
disp('Translation Matrix:');
disp(T);
disp('Inverse Translation Matrix:');
disp(T_inv);
