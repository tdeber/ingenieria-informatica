f = @(x) sin(x)+cos(1+x.^2)-1;
df = @(x) -2*x.*sin(x.^2+1)+cos(x);

##x = linspace(1,10,20);
##y = f(x);
##plot(x,y);

[p,h] = biseccion(f,7.8,8,400,1e-10);

x = linspace(1,10,20);
y = df(x);
plot(x,y);

[p2,r] = newton(f,df,1,1000,1e-10)
