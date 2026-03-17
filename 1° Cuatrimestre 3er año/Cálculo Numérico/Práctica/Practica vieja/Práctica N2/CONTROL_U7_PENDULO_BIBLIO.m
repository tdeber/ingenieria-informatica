
f = @(t,y) [ y(2);
            -(9.81/2).*sin(y(1)) ];

y0 = [0 ; 1];          % φ(0) = 0, φ'(0) = 1
h = 0.01;              % paso de integración
a = 0;
b = 10;
L = (b - a)/h;

[t, y] = rk4(f, [a b], y0, L);

fprintf("5 Cifras Decimales = %.5f \n", y(end,1));

fprintf("5 Cifras Exactas = %.5g \n", y(end,1));

