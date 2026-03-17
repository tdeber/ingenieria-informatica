function [A, r] = doolitle_p(A)
  n = size(A, 1);
  r = 1:n;
  for k = 1:n-1
    [pmax, p] = max(abs(A(r(k:n), k)));
    p = p + k - 1;
    if p ~= k
      r([p k]) = r([k p]);
    endif

    A(r(k+1:n), k) = A(r(k+1:n), k)/A(r(k), k);
    A(r(k+1:n), k+1:n) = A(r(k+1:n), k+1:n) - A(r(k+1:n), k) * A(r(k), k+1:n);
  endfor


endfunction

