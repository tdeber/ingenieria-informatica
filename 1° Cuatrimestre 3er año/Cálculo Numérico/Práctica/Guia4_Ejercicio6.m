a = 0.401;
b = 42.7e-6;
T = 300;
p = 3.5e+7;
k = 1.3806503e-23;
N = 1000;
tol = 1e-12;

xmin = 1e-5; #valor que toma V para que f(xmin)*f(xman) sea neg
xmax = 1;

vol = @(x) [p+a*(N/x)^2]*(x - N*b)-(k*N*T);
dvol = @(x) (x - N*b)*(-2*a*N^2/x^3) + (p + a*(N/x)^2);



x1 = vol(xmin);
x2 = vol(xmax);

p0 = 5.05e-3; #Valor promedio de xmin y xmax, es una aprox solamente
             #es un valor que debe estar cerca de la raiz

[v1,h1] = biseccion(vol,xmin,xmax,1000,tol);
#si evaluo vol(v1) me deberia dar tendiente a 0 con una toleracion tol

[v2,h2] = newton(vol, dvol, p0, 1000, tol),

