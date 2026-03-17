tol = 10^(-4);
d = @(x) (x-1)^2 + (x)^4;
df = @(x) 2*(x-1) + 4*(x)^3;
ddf = @(x) 2*x + 12*(x)^2;

#Para calcular los max o min de una funcion g(x)
#debo calcular su deriada g'(x) y buscar los puntos
#donde g'(x)=0
#verifico si es min o max con g''(x)

x0 = 0.5; #Esta cerca de la raiz df=0

[x,h]=newton(df,ddf,x0,100,tol);
