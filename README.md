# -Design-and-Analysis-of-an-Autopilot-Control-System-for-a-Riderless-Bicycle
 This project focuses on designing an autopilot system for a riderless bicycle to maintain
 vertical upright stability at three fixed velocities: 0 m/s, 3.5 m/s, and 5 m/s. Using a
 fourth-order linear parameter-varying (LPV) model with states comprising roll angle, roll
 rate, steer angle, and steer rate, the system takes steering torque as input and produces
 roll angle as output. The project involves:
 1. Deriving state-space models and transfer functions for each velocity, computing
 poles,zeros, and analyzing system eigenvalues.
 2. Simulating time responses under zero-input and unit step input conditions with
 assumed non-zero initial states.
 3. Analysing Asymptotic, marginal, BIBO stability at each velocity.
 4. Checking the possibility of control and Designing velocity-specific feedback con
trollers to stabilize the bicycle, meeting specific performance criteria related to
 steady-state error, damping ratio, and settling time
