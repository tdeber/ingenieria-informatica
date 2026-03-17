x = [-1 0 1 2];
y = [-1.1 -0.4 -0.9 -2.7];

z = log(-y);

#Me armo un nuevo polinomio
#z = ax^2+bx+c
c = polyfit(x,z,2); %-> met cuadrados min

#Funcion original que quiero encontrar
f = @(x) -exp(polyval(c,x));

%GRAFICA
t = linspace(-1.5,2.5,100);
plot(x,y,'o',t,f(t));

