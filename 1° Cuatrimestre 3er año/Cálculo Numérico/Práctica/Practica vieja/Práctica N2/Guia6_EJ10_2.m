%Ejercicio 10

#Funciones
f = @(x) (20*x - (x.^3/5));
df = @(x) (20 - 3*(x.^2)./5);

#Integral
INT = @(x) (2*pi.*f(x).*sqrt(1 + df(x).^2));

#Datos
a = 0;
b = 2;

%Utilizar cuadratura de Gauus para n=3 y comparar el resultado con
%con la regla de simpson para un solo intervalo.

CG = cuad_gauss_c(INT,a,b,2,3); #Cuadratura de Gauss
RS = simpson(INT,a,b); #Regla de Simpson

%Resulva la integral utilizando la regla de trapecio y Simpson compuesta
%para L=5

RT = trapezoidal(INT,a,b);
SC = simp_comp(INT,a,b,5);




