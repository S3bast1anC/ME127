Vf = 0 : 0.01 : 1;   % Goes from 0 to 1 in steps of 0.01
Vm = 1 - Vf;         % Matrix volume fraction

% Givens
Ef = 72;      % GPa
Em = 3.5;     % GPa

% Calculate E1 (Rule of Mixtures)
E1 = (Ef * Vf) + (Em * Vm);

% Calculate E2 (Reuss Model)
E2 = 1./((Vf/Ef)+(Vm/Em));

% --- Plotting ---
figure;
plot(Vf, E1, 'b-', 'LineWidth', 2); hold on;
plot(Vf, E2, 'r--', 'LineWidth', 2);
title('Copper-SiC Composite');
xlabel('Fiber Volume Fraction (V_f)');
ylabel('Modulus (GPa)');
legend('E1 (Longitudinal)', 'E2 (Transverse)', 'Location', 'best');
grid on;