n = 10;

A = zeros(n,n);
b = zeros(n,1);

A(1,1)=1;
b(1)=0;

A(n,n)=1;
b(n)=0;

  for i=2:n-1
    A(i,i-1)=-1;
    A(i,i)=2;
    A(i,i+1)=-1;
    b(i)=1/(n^2);
  endfor

  x = gauss_v(A,b);

  t = linspace(0,1,n);
  plot(t,x, '-o');
  xlabel('t');
  ylabel('x(t)');
  grid on;

