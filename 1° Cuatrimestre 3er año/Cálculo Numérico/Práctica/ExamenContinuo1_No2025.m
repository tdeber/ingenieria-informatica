n = 40;
A = zeros(n,n);

for i = 1:n

  for j=1:n

    if j==i
      A(i,j)=2;
    elseif (j==i+1) && (i!=40)
      A(i,j) = -1;
    elseif (j==i-1) && (i!=1)
      A(i,j)=-1;
    else
      A(i,j)=0;
    endif

  endfor

endfor

b = zeros(n,1);

for i=1:n
  b(i) = (1.5*i)-6;
endfor

x = gauss_p(A,b);

display(x(20));

w = 1.85;
tol = (10)^(-5);
x0 = zeros(n,1);
kmax=5000;

[x1, it1,r_h1] = jacobi (A,b,x0,kmax,tol);
[x2, it2, r_h2] = gaussseidel(A, b, x0, kmax, tol);
[x3, it3, r_h3] = sor(A, b, x0, kmax, tol, w);












