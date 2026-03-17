%Ejercicio 8

f = @(t,x) ([x(1).*(3-0.002*x(2));
            -x(2).*(0.5-0.0006*x(1))]);

#Cuando x(1) = 0 entonces x(2) disminuye
#por lo que x(1) es mi presa

x0 = [1600,800];
int = [0 24];
h = 0.05;
L = 24/0.05;

[t,x] = rk4(f,int,x0,L);

plot(t,x(:,1),"-r");
hold on;
plot(t,x(:,2),"-b");
