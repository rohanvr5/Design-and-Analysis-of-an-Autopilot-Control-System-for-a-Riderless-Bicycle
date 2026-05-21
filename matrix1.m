A1 = [0, 0, 1, 0;
     0, 0, 0, 1;
     13.67, 0.225, 0, 0;
     4.857, 10.81, 0, 0];
disp('Matrix A1:');
disp(A1);

% Define the 1x4 matrix C and 4x1 matrix B using the variable 'a'
C = [1, 0, 0, 0];    % 1x4 row vector
B = [0; 0; -0.339; 7.457];    % 4x1 column vector

% Display the matrices
disp('Matrix C:');
disp(C);

disp('Matrix B:');
disp(B);


syms s

% Define the 4x4 matrix using the symbolic variable 'a'
% X= S*I - A1 
X = [s, 0, -1, 0;
     0, s, 0, -1;
     -13.67, -0.225, s, 0;
     -4.857, -10.81, 0, s];

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
eigenvalues = eig(A1);

% to display the eigenvalues
disp('Eigenvalues of the matrix A1:');
disp(eigenvalues);
% to display the result
disp('Result of C * inv(X) * B:');
disp(Tf1);
 %now to find zero and poles of this tansfer function
 %  the numerator and denominator coefficients from obtained transfer
 %  function
num = [0,0, -67800,  0, 800631];  % Expand numerator as needed
den = 5 * [8000, 0, -195840, 0, 1173439];   % 5 times denominator coefficients

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
z = eig(A1); %
plot(real(z), imag(z), 'o')
axis equal
grid on
xlabel('Re(\lambda)')
ylabel('Im(\lambda)')
title('Eigenvalues in the Complex Plane')