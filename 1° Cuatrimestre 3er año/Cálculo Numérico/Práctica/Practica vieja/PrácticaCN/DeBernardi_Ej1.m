f = @(x) log(x.^2 + 1) - exp(x./2) .* cos(pi * x) - 1.106;

x = linspace(-6, 7, 100);
y = f(x);
plot(x, y, 'r-');
xlabel('x');
ylabel('f(x)');
title('Gráfica de f(x)');
grid on;

#A
#Tiene 7 raices de -1 a 6 que se pueden ver en la grafica

[x1,h1,it1] = biseccion(f,-6,0,1000,1e-6);
x1

#B
[x2,h2,it2] = biseccion(f,-2,0,1000,1e-7);
x2

#C
df = @(x) (2 .*x / (x.^2 + 1)) - (0.5 * exp(x / 2) .*cos(pi.*x) )+ pi * exp(x/2)*sin(pi.*x);
[x3,r3] = newton (f,df,3,100,10^(-10));
[x4,r4] = newton (f,df,3.05,100,1e-10);
[x5,r5] = newton (f,df,3.1,100,1e-10);

display('c');
x3
x4
x5

#D

#Si x es un punto fijo de f(x) entonces f(x)=x;
f2 = @(x) log(x.^2 + 1) - exp(x./2) .* cos(pi * x) - 1.106 -x;
[x6,h6,it6] = biseccion(f2,-1,2,100,1e-7);
x6


