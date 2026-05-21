A3 = [0, 0, 1, 0;
     0, 0, 0, 1;
     13.67, -32.75, -0.82, -2.76;
     4.857, -17.315, 18.105, -11.94];
disp('Matrix A3:');
disp(A3);

% Define the 1x4 matrix C and 4x1 matrix B using the variable 'a'
C = [1, 0, 0, 0];    % 1x4 row vector
B = [0; 0; -0.339; 7.457];    % 4x1 column vector

% Display the matrices
disp('Matrix C:');
disp(C);

disp('Matrix B:');
disp(B);

% s is the eigen value
syms s

% Define the 4x4 matrix using the symbolic variable 'a'
% X= S*I - A3 
X = [s, 0, -1, 0;
     0, s, 0, -1;
     -13.67, 32.75, s+0.82, 2.76;
     -4.857, 17.315,-18.105, s+11.94];

% Display the matrix
disp('Matrix X:');
disp(X);

% finding and to display the inverse
X_inv = inv(X);
disp('Inverse of Matrix X:');
disp(X_inv);
% Transfer function(Tf1) is: (C * inv(X) * B)
Tf3 = C * inv(X) * B;  % (1x4) * (4x4) * (4x1) 
% Finding eigenvalues of A1
eigenvalues = eig(A3);

% to display the eigenvalues
disp('Eigenvalues of the matrix A3:');
disp(eigenvalues);
% to display the result
disp('Result of C * inv(X) * B:');
disp(Tf3);
 %now to find zero and poles of this tansfer function
 %  the numerator and denominator coefficients from obtained transfer
 %  function
num = [0, 0, -33900, -2462898, -25008653.5];
den = [100000, 1276000, 6340560, 45732257, -7762930];

% Create the transfer function
sys = tf(num, den);

% Find zeros and poles
z = zero(sys);
p = pole(sys);

% Display results
disp('Zeros:');
disp(z);
disp('Poles:');
disp(p);
% Plot pole-zero map
figure;
pzmap(sys);
title('Pole-Zero Map');
xlabel('Real Axis');
ylabel('Imaginary Axis');
grid on;
% Plot eigne values
z = eig(A3); %
plot(real(z), imag(z), 'o')
axis equal
grid on
xlabel('Re(\lambda)')
ylabel('Im(\lambda)')
title('Eigenvalues in the Complex Plane')