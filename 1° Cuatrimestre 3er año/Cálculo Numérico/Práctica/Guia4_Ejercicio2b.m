x0 = 1.5;
tol = 1e-3;
kmax = 1000;

g1 = @(x) 0.5*((10-(x^3))^0.5);
g2 = @(x) (10/(4+x))^0.5;

[x1,h1] = puntofijo(g1,x0,kmax,tol);
[x2,h2] = puntofijo(g2,x0,kmax,tol);

display(x1);
display(x2);
