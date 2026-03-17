tol = 1e-6;
t = 0.02;

z = @(a) 0.04*sqrt(a+t)*(1-t)-t*sqrt(3*a)-0.02;

 %Si z pasa cerca de w = 0.04*sqrt(19+t)*(1-t) - t*sqrt(57)
%entonces a es aproximadamente 19

[a,h] = biseccion(z,18,20,100,tol);
a


%Raiz
nz = @(t) 0.04*sqrt(a+t)*(1-t)-t*sqrt(3*a);
[p,h] = biseccion(nz,-1,2,100,tol);
p
