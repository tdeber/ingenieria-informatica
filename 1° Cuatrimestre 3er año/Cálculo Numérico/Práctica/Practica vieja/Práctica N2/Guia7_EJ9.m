#Ejercicio9
#Pasos a seguir para pasar a Sistema de 1 orden
#Cambio de varibale
#y1 = y
#y2 = y'
#y3 = y''
#y3' = y'''
#dY^3 / dt + 4y3 +5y2 + 2y1 = - 4sen(t) -2cos(t)


#y1(0) = y(0)=1
#y2(0) = y'(0) = 0
#y3(0) = y''(0) = -1

a = 0;
b = 15;
inter = [a b];
y0 = [1;0;-1];

f = @(t,y) ([y(2);y(3);-4*y(3)-5*y(2)-2*y(1)-4*sin(t)-2*cos(t)]);


[t,y] = rk4(f,inter,y0,200);
format long g
h = (b-a)/200;

p = round((2.5-a/h)+1);
y25 = y(p,1);
