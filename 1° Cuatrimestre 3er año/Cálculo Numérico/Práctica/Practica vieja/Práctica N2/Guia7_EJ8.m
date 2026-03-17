#Ejer8
f = @(t,x)  [x(1).*(3-0.002.*x(2));(-1).*x(2).*(0.5-0.0006.*x(1))];
y0 = [1600 800];
h = 0.05;
inter = [0 24];
L = 24/h;

#x(1) es la presa y x(2) es el depredador
[t,y]=rk4(f, inter, y0, L)

plot(t,y(:,1),'-r');
hold on;grid on;
plot(t,y(:,2),'-b');
