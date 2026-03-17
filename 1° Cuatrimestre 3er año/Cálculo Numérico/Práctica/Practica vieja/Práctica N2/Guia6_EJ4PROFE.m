% Ej4TP062025
clear all; clc;
format long
% Funciones
fa = @(x) sin(pi*x);
fb = @(x) 1./(1+x.^2);
% Soluciones analíticas
Ia=2/pi;
Ib=atan(5)-atan(-5);
% Ponemos el vector error en cero
err=[];
% Generamos untos para la graficación
xa=linspace(0,5,201);
xb=linspace(-5,5,201);
% Calculamos por integracion numérica compuesta, pero con L=1
% es decir un solo intervalo, con diferentes cuadraturas.
for n=2:13
  Q1 = intNCcompuesta(fa,0,5,1,n);
  Q2 = intNCcompuesta(fb,-5,5,1,n);
  err=[err; abs(Ia-Q1) abs(Ib-Q2)];

  subplot(2,1,1),
  xia=linspace(0,5,n);
  plot(xa,fa(xa),xa,polyval(polyfit(xia,fa(xia),n-1),xa))
  grid on; grid minor

  subplot(2,1,2),
  xib=linspace(-5,5,n);
  plot(xb,fb(xb),xb,polyval(polyfit(xib,fb(xib),n-1),xb))
  grid on; grid minor
  pause(1)
endfor
err
