function [p,r] = puntofijo (g,p0,maxit,tol)
  tic();

  it=1;
  while it < maxit
    p = g(p0);

    r(it) = p-p0;
    if abs(p-p0) < tol
      break;
    endif

    p0 = p;
    it = it + 1;
  endwhile

  if it == maxit
    disp("no se encontro punto fijo en maxit iteraciones");
  endif

  t = toc();
endfunction
