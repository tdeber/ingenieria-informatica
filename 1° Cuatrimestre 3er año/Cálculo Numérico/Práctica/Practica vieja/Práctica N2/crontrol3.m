x = [-1 1 2 3 4];
y = [0.23 0.25 0.26 0.14 0.06];

#f(x) = a / (b*exp(x) + cx + 7.5)

# a/y = be^x + cx +7.5
#z = 1/x
#z = C1 e^x + C2 x + C3 -> serian los Coef 1 2 3 respectivamente
#-> Coef1 = b/a , Coef2 = c/a , Coef3 = 7.5/a

% Variable transformada
z = 1 ./ y;

% Construir la matriz del sistema
f1 = @(x) exp(x);
f2 = @(x) x;
f3 = @(x) ones(size(x));
M = [f1(x') f2(x') f3(x')];

A=M'*M;
b=M'*z';# -> z= 1./y

#Coeficientes
c = gauss_p(A,b);

# Coeficientes
Coef1 = c(1);  % b/a
Coef2  = c(2);  % c/a
Coef3 = c(3);  % 7.5/a

# Coeficientes Originales
a = 7.5 / Coef3;
b = Coef1 * a;
c = Coef2 * a;

#El resultado es con 7 cifras significativas
printf("a = %.7f\n", a);
printf("b = %.7f\n", b);
printf("c = %.7f\n", c);



