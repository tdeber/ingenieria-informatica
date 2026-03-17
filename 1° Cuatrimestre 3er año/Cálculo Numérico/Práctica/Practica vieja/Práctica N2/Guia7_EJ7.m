%Ejercicio 7

f = @(t,x) ([-t*x(2);t*x(1)-t*x(2)]);

a=0;
b=20;

x0 = [1;-1];

h = 0.05;
n = (b-a)/h;

[t,x]= euler(f,[a;b],x0,n);

figure();
plot(x(:,1),x(:,2),"linewidth",2);
grid on; grid minor;

%Rapidez de la particula en t=3

%Posicion de la particula en los 3 seg

%Instante de tiempo a partir del cual todos los puntos
%tienen una distancia al origen menor a 0.01




