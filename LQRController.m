% Controller
[A,B,C,D] = linmod2('InvertedDoublePendulumOnCart');
x=1;
y=1;
z=1;
Q=[x 0 0 0 0 0;
   0 y 0 0 0 0;
   0 0 z 0 0 0;
   0 0 0 0 0 0;
   0 0 0 0 0 0;
   0 0 0 0 0 0];
R = 1;
K = lqr(A,B,Q,R);