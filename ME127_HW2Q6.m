lf_over_df = 0 : 1 : 200;   % Goes from 0 to 1 in steps of 0.01

% Givens
Ef = 72;      % GPa
Em = 3.5;     % GPa
Vf = 0.4;

% Unidirectional discontinuous fiber lamina
nL = ((Ef/Em)-1)./((Ef/Em)+2*(lf_over_df));
E1 = (Em*(1+2*(lf_over_df).*nL*Vf))./(1-nL*Vf);


% --- Plotting ---
figure;
plot(lf_over_df, E1, 'b-', 'LineWidth', 2); hold on;
yline(30.9,'r--', 'Problem 1 E1: 30.9 GPa');
title('E1 vs lf/df');
xlabel('Fiber Aspect Ratio (lf/df)');
ylabel('Logitudinal Modulus E1 (GPa)');
grid on;