t1 = 0;
t2 = 0.0025;
t3=0.005;
t4=0.0075;
t5=0.01;

A = [sin(2*pi*440*t1)  sin(2*pi*660*t1) sin(2*pi*1100*t1) cos(2*pi*5*t1) sin(2*pi*8*t1);
    sin(2*pi*440*t2)  sin(2*pi*660*t2) sin(2*pi*1100*t2) cos(2*pi*5*t2) sin(2*pi*8*t2);
    sin(2*pi*440*t3)  sin(2*pi*660*t3) sin(2*pi*1100*t3) cos(2*pi*5*t3) sin(2*pi*8*t3);
    sin(2*pi*440*t4)  sin(2*pi*660*t4) sin(2*pi*1100*t4) cos(2*pi*5*t4) sin(2*pi*8*t4);
    sin(2*pi*440*t5)  sin(2*pi*660*t5) sin(2*pi*1100*t5) cos(2*pi*5*t5) sin(2*pi*8*t5)
 ];

b = [2.1004;4.3702;5.1745;-0.7222;0.9249];

[x] = gauss_p(A,b);


x0 = zeros(5,1);
[w] = wOptimo (A,b,x0,1e-4,1000);
[xs,it,r_h]=sor(A,b,x0,1000,1e-4,w);
