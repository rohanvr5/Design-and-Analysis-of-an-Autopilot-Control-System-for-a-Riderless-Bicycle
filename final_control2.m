T = feedback(C*a, 1);   % C is your designed controller
stepinfo(T)             % Check settling time, overshoot, etc.
dcgain(T)               % Check steady-state gain (for error)
