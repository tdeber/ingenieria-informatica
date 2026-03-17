%Ejercicio 9

f = @(t,y) ([y(2);y(3);-4*y(3)-5*y(2)-2*y(1)-4*sin(t)-2*cos(t)]);
#y(1) -> y
#y(2) -> y'
#y(3) -> y''
#y(4) -> dy(3) = y''' - igual al componente 3 de la f arriba. Despeje de la formula

y0 = [1;0;-1];
int = [0 5]; #2.5 para el B - 15 para el C
h = 0.05;
L = 2.5/h;

[t y] = rk4(f,int,y0,L);

%B-

plot(t,y(:,1),"-r");
hold on; grid on;

i = find(t<=2.5);

[t(i(end)) y(i(end),1)]

#C-

plot(t,y(:,2),"-b"); #5 veces se anula y' - Se puede ver tanto con y como con y'



