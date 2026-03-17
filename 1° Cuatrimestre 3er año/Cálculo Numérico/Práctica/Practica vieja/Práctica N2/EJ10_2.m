t = [4 8 12 16 20 24];
c = [1590 1320 1000 900 650 560];

#c(t) = be^(-kt)
# ln(c) = -k*t + ln(b)

c2 = polyfit(t,log(c),1);#-> -k*t + ln(b)

k = -c2(1); #-> -k
b = exp(c2(2)); #-> exp(ln(b)) -> b

f = @(x) b.*exp(-k.*x);

#GRAFICO

vals_t = linspace(0,50,201);
plot(t, c, 'ko', 'MarkerFaceColor', 'k'); hold on;
plot(vals_t,f(vals_t),'r--');

#B.
#c(0) = b*e^(0) = b
c_0 = f(0);
printf("La concentracion al final de la tormenta, t=0, es de apro  %.2f CFU/100mL\n",c_0);

#C.
#c(t) = be^(-kt) = 200 -> c(t)=be^(-kt)-200=0
#-> biseccion.

