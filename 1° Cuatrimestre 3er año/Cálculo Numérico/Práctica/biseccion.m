function [p,h] = biseccion(f,xmin,xmax,kmax,tol)

  it = 1;
  a = xmin;
  pant = xmin;
  b = xmax;
  h = [];

  while it<kmax
    p = a +(b-a)/2;

    %elegimos una condicion de corte
    %   error absoluto: abs(p-pant)
    %   error relativo: abs(p-pant)/abs(p)
    %   cercanica al eje x (el peor): abs(f(p))
    h(it) = abs(p-pant)/abs(p);
    if abs(f(p)) < tol
      break;
    endif

    if f(a)*f(p) > 0
      a = p;
    else
      b = p;
    endif

    pant = p;
    it++;

     if it == kmax
    disp("no se encontro punto fijo en maxit iteraciones");
  endif

  endwhile
