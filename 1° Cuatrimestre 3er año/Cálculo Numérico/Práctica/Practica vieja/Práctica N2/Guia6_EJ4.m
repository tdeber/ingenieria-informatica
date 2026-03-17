f1 = @(x) sin(pi.*x);
f2 = @(x) 1 ./(1 + x.^2);

%Solucion Excta -> Se sacaron analiticamente
exacto1 = 2/pi;
exacto2 = 2*atan(5);

%Vector de errores para mis errores abs entre mi sol exacta y la aprox
errores1 = zeros(12,1);
errores2 = zeros(12,1);

% Generamos untos para la graficación
xa=linspace(0,5,201);
xb=linspace(-5,5,201);

for i=1:12

  Qn1 = intNCcompuesta(f1,0,5,1,i+1);
  errores1(i) = abs(exacto1 - Qn1);

  %Primer Grafico
  subplot(2,1,1) #-> Me Divide la ventana del grafico en 2 fila 1 columna y grafico en la priemra
  xia = linspace(0,5,i+1); #En un nuevo intervalo para mi pol interpolante
  plot(xa,f1(xa),xa,polyval(polyfit(xia,f1(xia),i),xa));
  grid on; grid minor;


  Qn2 = intNCcompuesta(f2,-5,5,1,i+1);
  errores2(i) = abs(exacto2-Qn2);

  %Segundo Grafico
  subplot(2,1,2)
  xib = linspace(-5,5,i+1);
  plot(xb,f2(xb),xb,polyval(polyfit(xib,f2(xib),i),xb));
  grid on; grid minor;



  pause(1);
endfor




