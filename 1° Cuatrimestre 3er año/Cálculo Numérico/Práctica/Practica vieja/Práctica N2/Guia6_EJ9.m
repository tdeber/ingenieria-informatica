%Ejercicio 9

%Aproxime el valor de la siguiente integral usando cuadratura de Gauss con n=2
%(n´umero de puntos de integraci´on). Compare este resultado con el valor exacto de la integral y
%con aqu´el obtenido mediante la regla de Newton-Cotes que utiliza igual cantidad de puntos de
%integracion.

f = @(x) ((x.^2).* exp(-x));

CG = cuad_gauss_c(f,0,1,6,2);
IE = (-5/e)+2;
NC = intNCcompuesta(f,0,1,6,2);

E1 = IE - CG;
E2 = IE - NC;

