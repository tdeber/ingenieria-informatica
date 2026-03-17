% y' = -y + sin(t) + cos(t)
% y(0) = 0

#f = @(t,y) y-(t^2)+1;
% PVI a calcular
f = @(t,y) -y + sin(t) + cos(t);
y0 = 0; % Condicion Inicial

%================================================
% solucion analitica o exacta
y=@(t) sin(t);

tt=linspace(0,2,201);
yy=y(tt);
figure(1)
plot(tt,yy,'r-*')
grid on
grid minor
hold on
%================================================
L=20;
% CALCULAMOS CON TRES METODOS DIFERENTES: Euler, RK2 y RK4
#===============================
[t,w] = euler(f,[0,2],y0,L);
plot(t,w,'b-o')
#===============================
[t,w1]=rk2(f,[0,2],y0,L);

plot(t,w1,'k--o')
#===============================
[t,w2]=rk4(f,[0,2],y0,L);
plot(t,w2,'g-o')
#===============================

