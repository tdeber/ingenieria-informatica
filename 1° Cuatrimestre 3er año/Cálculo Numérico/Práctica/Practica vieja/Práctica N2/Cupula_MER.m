#TP3 2024 CUPULA:
#--------- Parte 1 (Guia 5)
f = @(x) 3*(x+0.5).*sin((x-2.7)/2).^4;
df = @(x) 3*(sin((x-2.7)/2)).^4 + 6*(x+0.5).*(sin((x-2.7)/2)).^3 .* cos((x-2.7)/2);
x_datos = linspace(0,2.4,11);

y_datos = f(x_datos);

df1 = df(0);
df2 = df(2.4);

[S,dS,ddS]=funcion_spline(x_datos,y_datos,df1,df2);#Spline sujeto

plot(x_datos,f(x_datos),x_datos,S(x_datos))

S_1metro = S(1) #Radio segun spline
Y_1metro = f(1)

err = abs(S_1metro-Y_1metro)#Error del modelo

#--- Parte 2
integrando = @(x) 2*pi*S(x).*sqrt(1+dS(x).^2);
I = cuad_gauss_c(integrando,0,2.4,10,3)
