% Define your system matrices A and B
A2 = [0, 0, 1, 0;
     0, 0, 0, 1;
     13.67, -15.93275, -0.574, -1.932;
     4.857, -2.97125, 12.6735, -8.358];
B = [0; 0; 0; 1];

% Calculate the controllability matrix
ControllabilityMatrix = [B, A2*B, (A2^2)*B, (A2^3)*B];

% Display the controllability matrix
disp('Controllability Matrix:');
disp(ControllabilityMatrix);

% Calculate and display the determinant
determinant = det(ControllabilityMatrix);
disp(['Determinant of the controllability matrix: ', num2str(determinant)]);
