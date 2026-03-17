#Y1 = f(n)
#Y2 = f'(n)
#Y3 = f''(n)
#Y4 = f'''(n) = -f(n)*f''(n) /2

% Datos
U = 2;
v = 1.5e-5;
h = 0.01;
int= [0 5];
L = 5 / h;

% Sistema de ecuaciones
f = @(n, y) [ y(2);
                y(3);
                -0.5 * y(1) * y(3)];

% Condiciones iniciales
y0 = [0; 0; 0.332];

% Integracion
[n y] = rk4(f, int, y0, L);

plot(n,y(:,2),"-b");
hold on;grid on; grid minor;

%B-
% 4.9100   3.1936   0.9899   0.0184

i = find(y(:,1)<0.99);

Espesor =  0.1623*sqrt((v*0.4)/U);
#x, lo pase a metros
#el 0.1623 es mi valor n99
n99 = 0.1623;
%C-
p=polyfit(n,y(:,2),3);
pn=@(n) polyval(p,n);

int = simpson(pn,0,n99);
q= sqrt(v*U*0.4)* int;


