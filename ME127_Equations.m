%Potential Givens 
%{
Em =            %
vm =            %
Vm =            %

Ef =            %
vf =            %
Vf =            %

A =             %
Am =            %
Af =            %
e =             %
C = 

lf_over_df =    %  
%}

% Fundamental Equations
%{

% Hook's Law
of = E*e

% Failure Strain
e = o/E

%Force Summation
o1*A = of*Af + om*Am

%}


% Plug-n-chuck Equations
%{

% Calculate E1 (Rule of Mixtures)
E1 = (Ef * Vf) + (Em * Vm);

% Calculate E2 (Reuss Model)
E2 = (Ef*Em)/(Vm*Ef + Vf*Em);

% Calculate G12 
G12 = (Gf*Gm)/(Vm*Gf + Vf*Gm);

% Calculate v12
v12 = Vf*vf + Vm*vm;

% Unidirectional discontinuous fiber lamina
E1 = (Em*(1+2*(lf_over_df)*nL*Vf))/(1-nL*Vf)
E2 = (Em*(1+2*nT*Vf))/(1-nT*Vf)
G12 = (Gm(1+nG*Vf))/(1-nG*Vf)
nL = ((Ef/Em)-1)/((Ef/Em)+2*(lf_over_df))
nT = ((Ef/Em)-1)/((Ef/Em)+2)
nG = ((Gf/Gm)-1)/((Gf/Gm)+1)

% Halpin-Tsai equations (alternative to unidirectional discontinuous lamina)
E2 = (Em*(1+C*n*Vf))/(1-n*Vf)
n = ((Ef/Em)-1)/((Ef/Em)+C)

% Randomly oriented discontinuous fiber lamina
E_rand = (3/8)*E1 + (5/8)*E2
G_rand = (1/8)*E1 + (1/4)*E2
v_rand = (E_rand/(2*G_rand))-1

%}

% Laminate 1
%{

% Solve Q Matrix
E1 =
E2 =
v12 =
G12 =

v21 = E2 * (v12 / E1);

% Calculate the individual elements of the Q matrix
Q11 = E1 / (1 - (v12 * v21));
Q22 = E2 / (1 - (v12 * v21));
Q12 = (v12 * E2) / (1 - (v12 * v21)); 
Q66 = G12;

Q = [Q11, Q12, 0;
     Q12, Q22, 0;
       0,   0, Q66];

disp(Q);
%}


% Laminate 2
%{
Q = [ 0, 0, 0; 
      0, 0, 0; 
      0, 0, 0 ];

theta_deg = ;

c = cosd(theta_deg);
s = sind(theta_deg);

T_inv = [  c^2,   s^2, -2*s*c;
           s^2,   c^2,  2*s*c;
           s*c,  -s*c, c^2-s^2 ];

T_inv_T = T_inv';

Q_bar = T_inv * Q * T_inv_T;

disp(Q_bar);
%}

E1 = 138;
E2 = 9;
v12 = 0.3;
G12 = 6.9;

v21 = E2 * (v12 / E1);

% Calculate the individual elements of the Q matrix
Q11 = E1 / (1 - (v12 * v21));
Q22 = E2 / (1 - (v12 * v21));
Q12 = (v12 * E2) / (1 - (v12 * v21)); 
Q66 = G12;

Q = [Q11, Q12, 0;
     Q12, Q22, 0;
       0,   0, Q66];
%disp(Q);

theta_deg = -45;

c = cosd(theta_deg);
s = sind(theta_deg);

T_inv = [  c^2,   s^2, -2*s*c;
           s^2,   c^2,  2*s*c;
           s*c,  -s*c, c^2-s^2 ];

T_inv_T = T_inv';

Q_bar = T_inv * Q * T_inv_T;
disp(Q_bar);