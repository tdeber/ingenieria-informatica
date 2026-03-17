f = @(m) 9.8*m.*(1-exp(-(17 ./m).*9))-17*35;

##x = linspace(67.5,68,200);
##y = f(x);
##plot(x,y);

[a,h] = biseccion(f,67.8,68,100,1e-5);

ff = @(c) 9.8*73*(1-exp(-(c/73).*9))-c*35;

x = linspace(17.8,19,200);
y = ff(x);
plot(x,y);

[c,h2] = biseccion(ff,17.8,19,100,1e-5);
