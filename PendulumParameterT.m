% Parameters
% g = 9.81; % Gravity
% L1 = 2.4; % Half Pendulum 1 Length
% L2 = 2.4; % Half Pendulum 1 Length
% m0 = 5; % Cart Mass
% m1 = 0.1; % Pendulum 1 Mass
% m2 = 0.1; % Pendulum 2 Mass
m0 = 0.67 ;
m1 = 0.15 ;
m2 = 0.075 ;
L1 = 0.15 ;
L2 = 0.2 ;
b0 = 0.15; % Cart Friction Coefficient
b1 = 0.005; % Pendulum 1 Friction Coefficient
b2 = 0.005; % Pendulum 2 Friction Coefficient
% Pendulum 1 Inertia
R1 = L1;
I10 = m1*(L1^2)/12;
I1 = I10+m1*(R1^2);

% Pendulum 2 Inertia
R2 = L2;
I20 = m2*(L2^2)/12;
I2 = I20+m2*(R2^2);
% Initial Conditions
xx = 0;
theta1 = 0;
theta2 = 0;