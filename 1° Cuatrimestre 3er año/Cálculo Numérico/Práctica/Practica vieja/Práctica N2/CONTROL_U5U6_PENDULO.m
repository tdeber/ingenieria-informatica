

f = @(t,y) ([ y(2);
              20*cos(y(1)).^2 - sin(y(1)) - y(2)]);


a=0;b=2;
y0 = [pi/2 ; 0];
int = [a b];
h = 0.05;
L1 = (b-a)/h;
L2 = (b-a)/0.01;
[t,y] = rk4(f,int,y0,L1);

[t2,y2] = rk4(f,int,y0,L2);

error = abs(y(end,2) - y2(end,2));

% Graficamos la solución
#plot(t, y(:,1), 'b', 'linewidth', 2); hold on;
#plot(t,pi/4, 'r--', '45°', 'linewidth', 1.5); % 45 grados = pi/4
#xlabel('Tiempo t');
#ylabel('Ángulo φ(t)');
#grid on;
