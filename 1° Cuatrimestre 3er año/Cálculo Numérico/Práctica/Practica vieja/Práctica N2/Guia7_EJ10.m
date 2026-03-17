%Ejercicio 10

f =@(t,y) [y(2); -sin(y(1))];
y0 = [0.1, 0];
y1 = [0.7, 0];
inter = [0,20];
h = 0.05;
L = 20/h;
[t,y]=rk4(f, inter, y0, L);

