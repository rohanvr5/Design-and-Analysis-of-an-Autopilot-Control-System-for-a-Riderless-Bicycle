% Define your system matrices A and B
A1 = [0, 0, 1, 0;
     0, 0, 0, 1;
     13.67, 0.225, 0, 0;
     4.857, 10.81, 0, 0];
B = [0; 0; 0; 1];

% Calculate the controllability matrix
ControllabilityMatrix = [B, A1*B, (A1^2)*B, (A1^3)*B];

% Display the controllability matrix
disp('Controllability Matrix:');
disp(ControllabilityMatrix);

% Calculate and display the determinant
determinant = det(ControllabilityMatrix);
disp(['Determinant of the controllability matrix: ', num2str(determinant)]);
