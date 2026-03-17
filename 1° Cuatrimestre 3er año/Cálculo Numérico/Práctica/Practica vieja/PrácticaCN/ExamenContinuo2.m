x=0.02;
f = @(pt) (x/(1-x))*sqrt((2*pt)/(2+x))-K;
##pt = 3.4;
K=0.04;
a=-1;
b=4;

##[p,h] = biseccion(f,a,b,100,1e-9);



[p,h] = biseccion(f,a,b,100,1e-8);




