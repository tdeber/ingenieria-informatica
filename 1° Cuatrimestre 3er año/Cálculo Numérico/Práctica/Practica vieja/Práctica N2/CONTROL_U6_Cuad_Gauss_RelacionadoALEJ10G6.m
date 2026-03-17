
f = @(x) 2 + cos(x) - sin(3 .*x);
df = @(x) -sin(x) - 3 .*cos(3 .*x);


int = @(x) 2*pi.*f(x).*sqrt(1 + df(x).^2);
a=0;
b=3;


CG = cuad_gauss_c(int,a,b,30,3);


