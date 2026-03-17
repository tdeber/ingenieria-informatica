p = @(x) 230*x^4 + 18*x^3 + 9*x^2 -221*x -9;

#Ahora yo debo de armar un x=g(x). Puedo hacer despejando P(X)=0
#lo que hago es despar mi -221*x de todo y luego depejar x

g = @(x) (1/9)*(230*x.^2 + 18*x.^1 -221*x.^-1 - 9*x^-2);


##x = linspace(-0.5,0.5,200);
##y=g(x);
##plot(x,y);

[p1,r1] = puntofijo (g,-0.5,100,1e-6);
[p2, r2] = puntofijo(g, 0.9, 100, 1e-6);

