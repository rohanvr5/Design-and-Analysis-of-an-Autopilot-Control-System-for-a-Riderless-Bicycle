% Example system (replace with your own A, B, C, D, x0 as needed)
A3 = [0, 0, 1, 0;
     0, 0, 0, 1;
     13.67, -32.75, -0.82, -2.76;
     4.857, -17.315, 18.105, -11.94];
B = [0; 0; -0.339; 7.457];    % 4x1 column vector
C = [1, 0, 0, 0];    % 1x4 row vector
D = 0;
x0 = [2; 2;0;0];           % Initial condition
t = 0:0.01:10;         % Time vector

% Symbolic variable for time
syms tau real

% Preallocate solution
x = zeros(length(x0), length(t));

% Compute STM (state transition matrix)
%Phi = expm(A1 * t');   % Each row is Phi(t) for a time instant
x = zeros(length(x0), length(t));
% Compute zero-input response: x_zi(t) = Phi(t) * x0
for k = 1:length(t)
    x(:,k) = expm(A3*t(k)) * x0;
end

% Compute zero-state response: integral_0^t Phi(t-tau)*B*u(tau) dtau
% For unit step input u(tau) = 1
for k = 1:length(t)
    % Define the integrand as a function of tau
    integrand = @(tau) expm(A3*(t(k)-tau)) * B;
    % Numerically integrate from 0 to t(k)
    integral_val = integral(@(tau) integrand(tau), 0, t(k), 'ArrayValued', true);
     x(:,k) = x(:,k) + integral_val;
end

% Compute output y(t) = C*x(t) + D*u(t)
u = ones(size(t)); % Unit step input
y = C * x + D * u;

% Plot the output
figure;
plot(t, y, 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Output y(t)');
title(' Time Response Using STM for V=5 m/s');
grid on;
