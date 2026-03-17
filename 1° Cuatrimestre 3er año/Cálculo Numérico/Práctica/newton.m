function [p,r] = Newton (f,df,p0,maxit,tol)

  it = 1;
  r = [];

  while it<maxit
    p = p0 - f(p0)/df(p0);

    %usamos una condicion de corte
    %   abs(f(p)) < tolerancia
    %   abs(p-p0) < tolerancia
    %   abs(p-p0)/abs(p) < tolerancia
    r(it) = abs((p - p0) / p);

    if abs(p-p0) < tol
      break;
    endif

    it = it+1;
    p0 = p;

  endwhile

  if it == maxit
    disp('no se encontro raiz en maxit iteraciones');
  endif





endfunction
