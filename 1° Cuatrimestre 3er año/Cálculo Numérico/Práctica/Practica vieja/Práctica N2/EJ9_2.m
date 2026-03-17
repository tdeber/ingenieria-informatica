x = [-1 0 1 2];
y = [-1.1 -0.4 -0.9 -2.7];
#f(x) = -e^(ax^2+bx+c)

z = log(-y);# ->ln(-y)

y2 = polyfit(x,z,2);#-> ax^2+bx+c

f = @(x) -exp(y2(1).*x.^2 + y2(2).*x + y2(3));

#GRAFICA
vals_x = linspace(-1.5,2.5);
plot(x, y, 'ko', 'MarkerFaceColor', 'k'); hold on;
plot(vals_x,f(vals_x),'r--');
