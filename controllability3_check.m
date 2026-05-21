% Define your system matrices A and B
A3 = [0, 0, 1, 0;
     0, 0, 0, 1;
     13.67, -32.75, -0.82, -2.76;
     4.857, -17.315, 18.105, -11.94];
B = [0; 0; 0; 1];

% Calculate the controllability matrix
ControllabilityMatrix = [B, A3*B, (A3^2)*B, (A3^3)*B];

% Display the controllability matrix
disp('Controllability Matrix:');
disp(ControllabilityMatrix);

% Calculate and display the determinant
determinant = det(ControllabilityMatrix);
disp(['Determinant of the controllability matrix: ', num2str(determinant)]);
