x = [0 1 2 3 4 5 6];
y = [432 599 1012 1909 2977 4190 5961];

#A
p6 = polyfit(x,y,6);

#B
p1 = polyfit(x,y,1);

#C
p2 = polyfit(x,y,2);

#D
  t = linspace(0,6,100); %Para graficar

  %Evaluamos los modelos
  y_p6 = polyval(p6,t);
  y_p1 = polyval(p1,t);
  y_p2 = polyval(p2,t);

  %Grafico
  plot(x, y, 'ko', 'MarkerFaceColor', 'k'); hold on;
  plot(t, y_p6, 'b-', 'DisplayName', 'Grado 6 (interp)');
  plot(t, y_p1, 'r--', 'DisplayName', 'Lineal');
  plot(t, y_p2, 'g-.', 'DisplayName', 'Cuadrático');
  legend show;
  xlabel('Semana'); ylabel('Cantidad de mosquitos');
  title('Modelos de crecimiento de mosquitos');
  grid on;

#E
pred_p6 = polyval(p6,10);
pred_p1 = polyval(p1,10);
pred_p2 = polyval(p2,10);

#F
real = 14900;
error_real_p1 = abs(pred_p1 - real) / real;
error_real_p2 = abs(pred_p2 - real) / real;
error_real_p6 = abs(pred_p6 - real) / real;


