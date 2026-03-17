%Ejercicio 4 - Guia 6
%Considerando que Qn(f,a,b) denota la formula de Newton-Cotes de n puntos
%en el intervalo [a,b].

#A)

#Defino mis funciones a aprox con N-C
fa = @(x) sin(pi*x);
fb = @(x) 1 ./(1 + x.^2);

#Valor análitico de las funciones (integrales evaluadas).

va = 2/pi;
vb = 2*atan(5);

#Tabla
difa = zeros(12,1);
difb = zeros(12,1);

#Bucle

for (i=1:12)

  difa(i) = abs(va - intNCcompuesta(fa,0,5,1,i+1));
  difb(i) = abs(vb - intNCcompuesta(fb,-5,5,1,i+1));

endfor

