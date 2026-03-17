%Funciones
fa = @(x) sin(pi .* x);


%Soluciones Analiticas
sa = 2/pi;


%-----
Ta = [];

L = 20;
for i=1:12

    QL2 = intNCcompuesta(fa,0,5,L,2);
    QL3 = intNCcompuesta(fa,0,5,L,3);
    EL = abs([QL2 QL3] - sa);

    QL2_2 = intNCcompuesta(fa,0,5,L/2,2);
    QL3_2 = intNCcompuesta(fa,0,5,L/2,3);
    DfL2 = QL2_2/QL2;
    DfL3 = QL3_2/QL3;

  Ta = [Ta; L QL2 EL(1) QL3 EL(2)];




  L*=2;
endfor


#=============================================================
%B_
% La formula del trapecio tiene orden de convergencia 2 osea O(h^2)
%como h = b-a/L, a medida que L se hace grande mi h disminuye enttonces
%se podria decir que si, que a medida que el L aumenta el error disminuye
%y la aprox es cada vez mejor.

%C_
%Lo mismo que el anterior solo que este es de O(h^4)
%por lo que tiene mas rapido a achicarse el error
%


%IMPORTANTE
%Para hallas los k de la O(n^k) de los errores
%osea el orden de los errores
% tomo un error_i/error_i+1 y le calculo el log en base 2.

#>> 0.03306638177430743 / 0.008202335851850151
#ans = 4.0313
#>> log2(ans)
#ans = 2.0113


