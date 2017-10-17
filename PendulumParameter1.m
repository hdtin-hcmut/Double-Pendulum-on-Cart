% Parameters

g=9.81; % Gravity

M=5; % Cart Mass
m1=0.1; % Pendulum 1 Mass
m2=0.1; % Pendulum 2 Mass

b=0.15; % Friction Coefficient
b1=0.005; % Pendulum 1 Friction Coefficient
b2=0.005; % Pendulum 2 Friction Coefficient

L1=2.4; % Half Pendulum 1 Length
L2=2.4; % Half Pendulum 1 Length

% Pendulum 1 Inertia
R1=L1;
I10=m1*(L1^2)/12;
I1=I10+m1*(R1^2);

% Pendulum 2 Inertia
R2=L2;
I20=m2*(L2^2)/12;
I2=I20+m2*(R2^2);

% Initial Conditions
xx=0;
theta1=0;
theta2=0;