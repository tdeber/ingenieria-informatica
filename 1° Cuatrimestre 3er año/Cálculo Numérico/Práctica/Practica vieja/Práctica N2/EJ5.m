%1. Puntos equispaceados

x = linspace(-11,1,21);

f = sin(2*pi*x);
f_pert = f + (-1).^(1:21) * 1e-4;

% 2. Puntos para graficar
xx = linspace(-1, 1, 1000);
ff = sin(2*pi*xx);

% 3. Polinomio de Lagrange (base de Newton con polyfit para simplicidad)
p = polyfit(x, f, 20);
p_pert = polyfit(x, f_pert, 20);
lagrange = polyval(p, xx);
lagrange_pert = polyval(p_pert, xx);


% 4. Trazador cúbico natural
spline_nat = cubic_spline_natural(x, f);          % f normal
spline_pert = cubic_spline_natural(x, f_pert);    % f perturbado

% 5. Gráfica
figure;

subplot(2,1,1);
plot(xx, ff, 'k-', 'LineWidth', 1.5); hold on;
plot(xx, lagrange, 'r--');
legend('f(x)', 'Lagrange', 'Spline Natural');
title('Interpolación Exacta');
grid on;

subplot(2,1,2);
plot(xx, ff, 'k-', 'LineWidth', 1.5); hold on;
plot(xx, lagrange_pert, 'r--');
plot(xx, spline_vals_pert, 'b-.');
legend('f(x)', 'Lagrange (pert)', 'Spline Natural (pert)');
title('Con valores perturbados');
grid on;
