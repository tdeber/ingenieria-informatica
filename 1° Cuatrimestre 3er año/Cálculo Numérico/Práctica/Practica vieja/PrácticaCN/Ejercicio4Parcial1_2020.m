
f = @(x) sin(x) + cos(1 + x.^2)-1;
df = @(x) cos(x) - 2 .*x .*sin(1 + x.^2);

x = linspace(6,8,1000);
y = f(x);
plot(x,y,'r-');
hold on;
ejey = linspace(-5,5,100);
plot(p,ejey,'b-');

[p,r] = newton (f,df,1,100,1e-6);
