#F  = ma = mg - cv
#F = mr'' = mg - cr'

#Y1 = r
#Y2 = r'
#Y3 = g - cr'/m

f = @(t,x) ([y(2);
           g - (c*y(2))/m]);


g = -9.81;
m = 10;
c = 0.2;
y0 = [30,40];
int = [0 5];
h= 0.05;
L = 100;


[t,y] = rk4(f,int,y0,L);
