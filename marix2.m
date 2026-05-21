A2 = [0, 0, 1, 0;
     0, 0, 0, 1;
     13.67, -15.93275, -0.574, -1.932;
     4.857, -2.97125, 12.6735, -8.358];
disp('Matrix A2:');
disp(A2);

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
% X= S*I - A2 
X = [s, 0, -1, 0;
     0, s, 0, -1;
     -13.67, 15.93275, s+0.574, 1.932;
     -4.857, 2.97125,-12.6735, s+8.358];

% Display the matrix
disp('Matrix X:');
disp(X);

% finding and to display the inverse
X_inv = inv(X);
disp('Inverse of Matrix X:');
disp(X_inv);
% Transfer function(Tf1) is: (C * inv(X) * B)
Tf1 = C * inv(X) * B;  % (1x4) * (4x4) * (4x1) 
% Finding eigenvalues of A1
eigenvalues = eig(A2);

% to display the eigenvalues
disp('Eigenvalues of the matrix A2:');
disp(eigenvalues);
% to display the result
disp('Result of C * inv(X) * B:');
disp(Tf1);
 %now to find zero and poles of this tansfer function
 %  the numerator and denominator coefficients from obtained transfer
 %  function
num = [0, 0, -2712000, -137873768, -958583464];
den = [8000000, 71456000, 148671552, 790072549, 294147034];

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
z = eig(A2); %
plot(real(z), imag(z), 'o')
axis equal
grid on
xlabel('Re(\lambda)')
ylabel('Im(\lambda)')
title('Eigenvalues in the Complex Plane')