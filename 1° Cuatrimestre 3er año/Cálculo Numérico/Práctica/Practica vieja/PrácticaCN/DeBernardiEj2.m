A = [2 1 0 -2 1;
     2 2 1 2 -1;
     -2 -2 2 1 0;
     -1 1 1 2 1;
     -2 2 -2 0 3];

b = [2;0;6;7;3];

[x1] = gauss_p(A,b);

x0 = zeros(5,1);

[x2,it2,r2] = jacobi(A,b,x0,1000,1e-4);
[x3,it3,r3] = gaussseidel(A,b,x0,5000,1e-4);
ej = norm(x2-x1,'inf')/norm(x1,'inf');
