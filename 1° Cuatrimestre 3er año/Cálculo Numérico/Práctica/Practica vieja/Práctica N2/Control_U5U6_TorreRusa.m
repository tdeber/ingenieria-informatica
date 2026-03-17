#Cupula de una torre rusa
#f(x) = 3*(x + 0.5) * sin((x-2.7)/2).^4  , x = [0,2.4]

f = @(x) 3 .*(x + 0.5) .* sin((x-2.7)/2).^4;
df = @(x) 3 .* sin((x-2.7)/2).^4 + 3 .*(x+0.5) .*2 .*sin((x-2.7)/2) .^3 .* cos((x-2.7)/2);

df1 = f(0);
df2 = df(2.4);

xx = linspace(0,2.4,11);

[S,dS,ddS]=funcion_spline(xx,f(xx),df1,df2);

#A
S1 = S(1); #Mi radio en x=1 segun el splne

Y1 = f(1); #Valor en mi f(1);

error = abs(S1-Y1); #Error cometido con el modelo f(x)

#B-

AreaCup = @(x) 2*pi.*S(x).*sqrt(1+dS(x).^2);
a=0;
b=2.4;

r = cuad_gauss_c(AreaCup,a,b,1,10);
