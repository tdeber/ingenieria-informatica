##f = @(x) x^3 - 2*x - 5;
##df = @(x) 3*x^2 - 2;
##[x, h] = newton(f, df, 2, 100, 1e-8)

f = @(x) x^3 - x - 2;
[p, h] = secante(f, 1, 2, 100, 1e-8)

