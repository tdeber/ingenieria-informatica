 function[x,it,r_h]=sor(A,b,x0,maxit,tol,w)

      tic();
  n = length(b);
  x=x0;
  it = 0;
#calcular W optimo
  while(it < maxit)
    for i = 1:n
      x(i) = (1-w)*x0(i)+ w*(b(i) -A(i,1:i-1)*x(1:i-1)-A(i,i+1:n)*x0(i+1:n))/A(i,i);
    endfor
    r_h(it+1) = norm(x-x0,'inf')/norm(x,'inf');

    if r_h(it+1) < tol
        break;
    endif
    x0=x;
    it = it+1;
  endwhile

  t= toc();

endfunction
