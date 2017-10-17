% Define the parameters
m0 = 0.67 ;
m1 = 0.15 ;
m2 = 0.075 ;
L1 = 0.15 ;
L2 = 0.2 ;
g = 9.81;
% L1 = 2.4; % Half Pendulum 1 Length
% L2 = 2.4; % Half Pendulum 1 Length
% m0 = 5; % Cart Mass
% m1 = 0.1; % Pendulum 1 Mass
% m2 = 0.1; % Pendulum 2 Mass
% Pendulum 2 Inertia
R1 = L1;
I10 = m1*(L1^2)/12;
I1 = I10+m1*(R1^2);
% Pendulum 2 Inertia
R2 = L2;
I20 = m2*(L2^2)/12;
I2 = I20+m2*(R2^2);
h1 = m0+m1+m2;
h2 = m1*(L1/2)+m2*(L2/2);
h3 = m2*(L2/2);
h4 = m1*(L1/2)^2 + m2*L1^2+I1;
h5 = m2*(L2/2)*L1;
h6 = m2*(L2/2)^2 + I2;
h7 = m1*(L1/2)*g + m2*L1*g;
h8 = m2*(L2/2)*g;
dt = 0.02 ;
a1 = (0.5*m1+m2)*L1;
a2 = 0.5*m2*L2;
a3 = ((1/3)*m1+m2)*L1*L1;
a4 = 0.5*m2*L1*L2;
a5 = (1/3)*m2*L2*L2;
m = m0+m1+m2;
f1 = (0.5*m1+m2)*g*L1;
f2 = 0.5*m2*g*L2;
% Define the system matrices
D0 = [m, a1, a2; a1, a3, a4; a2, a4, a5];
Dg = [0, 0, 0; 0, -f1, 0; 0, 0, -f2];
H = [1; 0; 0];
% Define the State Space System
A = [zeros(3),eye(3);-inv(D0)*Dg,zeros(3)];
B = [zeros(3,1);inv(D0)*H];
C = eye(6);
D = [0; 0; 0; 0; 0; 0]; 
sys = ss(A,B,eye(6),0);
%impulse(sys);
% Define the new system
poles = eig(A);
co = ctrb(sys);
controllability = rank(co);
% Compute the feedback k
R = 1;
Q = diag([1 1 1 1 1 1]);
%Q = diag([100 50 50 700 700 700]);
K = lqr(sys,Q,R);
sysnew = ss(A-B*K,B,C,0);
% Simulate the system for initial conditions
%[y,t,x]=initial(sysnew,[0;deg2rad(10);-deg2rad(10);0;0;0],15);
%t = 0:0.01:20;
[y,t,x] = initial(sysnew,[0;deg2rad(20);deg2rad(20);0;0;0],20);
% Convert from rad to deg
%y(:,2:3) = rad2deg(y(:,2:3));
%y(:,5:6) = rad2deg(y(:,5:6));
% Plot the data in deg
close all
%Plot 6 do thi dap ung
for i=1:6
subplot(2,3,i)
plot(t,y(:,i))
xlabel('Time(s)');
if     (i==1)
    title('Cart position');
    ylabel('x(m)');
elseif (i==2)
    title('Lower Pendulum Agle');
    ylabel('(rad)');
elseif (i==3)
    title('Upper Pendulum Agle');
    ylabel('(rad)');
elseif (i==4)
    %title('Cart Velocity');
    ylabel('(m/s)');
elseif (i==5)
    %title('Lower Pendulum Agle Velocity');
    ylabel('(rad/s)');
elseif (i==6)
    %title('Upper Pendulum Agle Velocity');
    ylabel('(rad/s)');
end 
grid on
end