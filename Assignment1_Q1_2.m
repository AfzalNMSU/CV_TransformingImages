% Define the rotation angle in radians
theta = pi/3; % Example rotation angle of 60 degrees

% Create the rotation matrix
R = [cos(theta) -sin(theta) 0;
     sin(theta) cos(theta)  0;
     0          0           1];

% Compute the inverse rotation matrix (which is the transpose)
R_inv = R';

% Display the rotation matrix and its inverse
disp('Rotation Matrix:');
disp(R);
disp('Inverse Rotation Matrix:');
disp(R_inv);
