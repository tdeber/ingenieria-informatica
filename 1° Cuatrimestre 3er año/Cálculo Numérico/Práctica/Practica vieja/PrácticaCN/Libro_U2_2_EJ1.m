f = @(x) x.^4+2*x.^2-x+3;

g1 = @(x) (3+x-2*x.^2).^(1/4);

x = linspace(-5,5,200);
y=g1(x);
plot(x,y,'r-');
hold on;
plot(x,0,'b-');
