% Ej5TP062025.m
% Funciones
fa = @(x) sin(pi*x);
fb = @(x) 1./(1+x.^2);
fc = @(x) abs(x).^(3/2);

% Solucion Analita de la Integral
Ia = 2/pi;
Ib = atan(5)-atan(-5);
Ic = 10*sqrt(5);

Ta=[]; Tb=[]; Tc=[];

xa=linspace(0,5,201);
xb=linspace(-5,5,201);

L=20;
for n=1:12
  QL2=intNCcompuesta(fa,0,5,L,2);
  QL3=intNCcompuesta(fa,0,5,L,3);
  Ea=abs([QL2 QL3]-Ia);
  Ta=[Ta; L QL2 Ea(1) QL3 Ea(2)];
  %=================================
  QL2=intNCcompuesta(fb,-5,5,L,2);
  QL3=intNCcompuesta(fb,-5,5,L,3);
  Eb=abs([QL2 QL3]-Ib);
  Tb=[Tb; L QL2 Eb(1) QL3 Eb(2)];
  %=================================
  QL2=intNCcompuesta(fc,0,5,L,2);
  QL3=intNCcompuesta(fb,0,5,L,3);
  Ec=abs([QL2 QL3]-Ic);
  Tc=[Tc; L QL2 Ec(1) QL3 Ec(2)];
  %=================================
  L*=2; % Duplico el valor de L
endfor
% visualizamos solo uno de ellos (caso c)
Ta
Ct(:,1) = Ta(1:end-1,3)./Ta(2:end,3);
Cs(:,1) = Ta(1:end-1,5)./Ta(2:end,5);
%=================================
Ct(:,1) = Tb(1:end-1,3)./Tb(2:end,3);
Cs(:,1) = Tb(1:end-1,5)./Tb(2:end,5);
%=================================
Ct(:,1) = Tc(1:end-1,3)./Tc(2:end,3);
Cs(:,1) = Tc(1:end-1,5)./Tc(2:end,5);

%Lo ultimo basicamente me estima la razon de convergencia del error.
%E = K / L^p
%2^p = al valor que me da, deberian ser casi los mismo y disminuir
