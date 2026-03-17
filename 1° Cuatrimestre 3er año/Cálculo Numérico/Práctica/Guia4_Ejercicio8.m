
Et = @(t) ((t+ (1/3))^3 + (1/3))*exp(-t);

e = @(t) ((t+ (1/3)).^3 + (1/3)).*exp(-t) - 1.5;
de = @(t) (3*(t+(1/3)).^2 - (t + (1/3)).^3 - 1/3).*exp(-t);


##x = linspace(0,3,9);
##y=e(x);
##plot(x,y);
##grid on;

#Como en la grafica para que e(t) tome el valor de 1.5
#t tendria que valer aprox 1.5, entonces uso ese valor para acercame

#A)
t0 = 1.5;
tol = 1e-10;
[e1,h1] = newton(e,de,t0,100,tol);
Et(e1);

#e1 es el valor que hace que E(t) sea 1.5

#B)

dde = @(t) (6*(t + (1/3)) - 3*(t+(1/3)).^2 - 2*(t+(1/3)).^3 + 1/3).*exp(-t);
t1 = 2.5; #Es un punto cercano al max
[e2,h2] = newton(de,dde,t1,1000,tol);
#e2 es el valor que hace que E(t) tome su valor maximo


