function [x] = gauss_p(A,b)
n=length(b);
A=[A b];
r=1:n;
epsilon=1e-9;
for k=1:n-1
  % la funcion max devuelve
  % pmax: el pivote de mayor valor absoluto
  % p: posicion donde se encuentra pmax (local)
  [pmax,p] = max(abs(A(r(k:n),k)));
  if pmax<epsilon
    disp('Los posibles pivots son CERO');
    break;
  endif
    p = p+k-1; %actualizamos pos. a numeracion global
  if p~=k
    r([p k])= r([k p]); %actualiza el pivote
  endif
  A(r(k+1:n),k) = A(r(k+1:n),k)/A(r(k),k);
  A(r(k+1:n),k+1:n+1) = A(r(k+1:n),k+1:n+1)-...
  A(r(k+1:n),k)*A(r(k),k+1:n+1);
endfor

  b = A(:,n+1);
  A = A(:,1:n);

  x=sust_atras(A(r,:),b(r));
##
##fuction[x] = eliminacionGauss(A,b)
##n=length(A);
##r=1:n;
##for k=1:n
##  [~,p]=max(abs(A(r(k:n),k)));
##  p = p+k-1
##  r([k p])= r([p k]);
##  m=A(r(k+1:n),k)/A(r(k),k);
##  b(r(k+1:n)=b(r(k+1:n))-m*b(r(k));
##  A(r(k+1:n),k+1:n) -=m*A(r(k),k+1:n);
##end
##x = sust_atras(A,b,r);
##endfunction





