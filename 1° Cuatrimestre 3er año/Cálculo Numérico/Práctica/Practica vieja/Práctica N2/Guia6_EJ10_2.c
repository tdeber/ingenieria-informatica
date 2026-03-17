%Ejercicio 10

#Funciones
f = @(x) (20*x - (x.^3/5));
df = @(x) (20 - 3*(x.^2)./5);

#Integral
INT = @(x) (2*pi.*f(x).*sqrt(1 + df(x).^2));

#Datos
a = 0;
b = 2;

#Utilizar cuadratura de Gauus para n=3 y comparar el resultado con
#con la regla de simpson para un solo intervalo.

x = linspace(a,b,20);

CG = cuad_gauss_c(INT,a,b,2,3);
RS = simpson(INT,a,b);


