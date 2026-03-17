% Definimos la matriz A y el vector b
A = [10 -1 2 0;
     -1 11 -1 3;
     2 -1 10 -1;
     0 3 -1 8];

b = [6; 25; -11; 15];

% Vector inicial (todo ceros)
x0 = zeros(4,1);

% Tolerancia y máximo número de iteraciones
Tol = 1e-6;
Kmax = 100;

% Llamada a la función Jacobi
[x, it, r_h] = jacobi(A, b, x0, Tol, Kmax);

fprintf("Solución x:\n");
disp(x);

fprintf("Iteraciones: %d\n", it);

fprintf("Errores relativos por iteración:\n");
disp(r_h');
