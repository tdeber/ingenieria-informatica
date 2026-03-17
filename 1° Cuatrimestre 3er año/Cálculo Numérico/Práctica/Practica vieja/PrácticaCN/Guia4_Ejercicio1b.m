f = @(x) x^3+x-4;
xmin=1;
xmax=4;
tol = 10^(-3);
kmax = 2000;

[x,h] = biseccion(f, xmin, xmax,kmax,tol);
