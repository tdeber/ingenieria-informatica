function [x,it,r] = gaussseidel(A,b,x0,maxit,tol)
  tic();

  n=length(A(1,:));

  x=x0;
  it=1;
  %usamos x0 para almacenar el x de la iteracion anterior
  while (it < maxit)
    for i=1:n
      x(i) = (b(i) - A(i,1:i-1)*x(1:i-1) - A(i,i+1:n)*x0(i+1:n))/A(i,i);
    endfor

    r(it+1) = norm(x-x0,'inf')/norm(x,'inf');

    #norma inf del residuo  norm(A*x-b ,inf)
    #norma inf del error abs norm(x-x0,'inf');
    #norma inf del error relativo norm(x-x0,'inf')/norm(x,'inf');


    if r(it+1) < tol
      break;
    endif

    x0=x;
    it=it+1;
  endwhile

  t = toc();
endfunction
