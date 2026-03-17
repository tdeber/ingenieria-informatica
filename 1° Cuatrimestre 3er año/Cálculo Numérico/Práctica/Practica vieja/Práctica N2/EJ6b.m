x1 = [1, 2, 3];
y1 = [0, 4, 22/3];
df1 = 3;
df2 = 3;

[S,dS,ddS] = funcion_spline(x1,y1,df1,df2);


[a,b,c,d] = cubic_spline_clamped(x1, y1, df1, df2);
 #Formas equivalentes, solo que en la segunda tengo que armar :
 #S(x) = ai + bi(x-xi) + ci(x-xi)^2+di(x-xi)^3

 disp("Tramo 1: de 1 a 2");
fprintf("S0(x) = %.4f + %.4f(x-1) + %.4f(x-1)^2 + %.4f(x-1)^3\n", ...
        a(1), b(1), c(1), d(1));

disp("Tramo 2: de 2 a 3");
fprintf("S1(x) = %.4f + %.4f(x-2) + %.4f(x-2)^2 + %.4f(x-2)^3\n", ...
        a(2), b(2), c(2), d(2));


