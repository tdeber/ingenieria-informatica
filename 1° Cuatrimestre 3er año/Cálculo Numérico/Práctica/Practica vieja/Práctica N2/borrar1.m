%Practica TP4:
format long
yy0 = pi/2;
yyp0 = 0;%Parte del reposo

y0 = [yy0; yyp0];
inter = [0,2];
L = 100;

pendulo = @(t,y) [ y(2) ; 20.* (cos(y(1))).^2 - sin(y(1)) - y(2) ];

disp('l = 400')
L = 400;
[t,y]=rk4(pendulo, inter, y0, L);
yy = y(:,1)

%Tabla de valores:
yypp = y(:,2);
yy = y(:,1);

yy
