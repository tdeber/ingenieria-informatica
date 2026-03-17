tol = 1e-6;
##format long;
z = @(t) 0.04*sqrt(a+t).*(1-t)-t.*sqrt(3*a);
taux = 0.02;
#Si z(t) posee un pto fijo en t=0.02 entonces z(t)=0.02

nz = @(a) 0.04*sqrt(a+taux)*(1-taux)-taux*sqrt(3*a)-0.02;
#Si la funcion pasa cerca de w(t) entonces (a) es aprox 19

[a,h] = biseccion(nz,18,20,100,1e-6);
printf('%.6f\n', a);
x = linspace(-2,2,10);
y = z(x);
plot(x,y);
grid on;

#Puedo observar a travez de la grafica que mi z tiene raiz en un numero aprox al 0

[t,h2] = biseccion(z,-1,1,100,tol);
printf('%.6f\n', t);

