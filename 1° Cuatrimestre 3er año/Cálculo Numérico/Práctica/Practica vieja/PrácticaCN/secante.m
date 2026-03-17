function [p,h] = secante(f,p0,p1,kmax,tol)

  it=1;
  h = [];
  while (it<kmax)

    p = p0 - ( f(p0)*(p0-p1) )/( f(p0)-f(p1) );

    %usamos una condicion de corte
    %   abs(f(p)) < tolerancia
    %   abs(p-p0) < tolerancia
    %   abs(p-p0)/abs(p) < tolerancia
    h(it) = p-p0;
    if abs(p-p0) < tol
      break;
    endif

    it = it+1;
    p1 = p0;
    p0 = p;

  endwhile

  if it == kmax
    disp('no se encontro raiz en maxit iteraciones');
  endif

endfunction
