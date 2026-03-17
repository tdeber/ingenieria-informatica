f_a = @(a) 0.04*sqrt(a+0.02).*(1-0.02)-sqrt(3*a).*(0.02)-0.02;
[a,h] = biseccion(f_a,18,20,100000,0.0000001);
z =  @(t) 0.04*sqrt(a+t).*(1-t) - t.*sqrt(3*a);
    disp("valor del coeficiente a")
    a
[tF,h2] = biseccion(z,0,2,100000,0.0000001);
disp("valor de la raiz de z(t)")
    tF
