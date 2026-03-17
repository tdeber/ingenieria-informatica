
% Ejercicio Nº 10 de la Guia TP06 2021- El area de la superficie de revolucion
% fue calculada haciendo girar la función f(x) alrededor del eje X
% F: es el integrando.

%====================================
f = @(x) 20*x - (x.^3)/5;
df = @(x) 20 - 3*(x.^2)/5;
%====================================
%f = @(x) 2.5 + x.*cos(2*x);
%df = @(x) cos(2*x) -2*x.*sin(2*x);
%====================================

% Area de revolucion
F = @(x) 2*pi*f(x).*sqrt(1+df(x).^2);
x=linspace(0,2,20);
disp('============================================')
disp('Datos del Problema')
a = 0
b = 2
L=1
n=3

%RESOLUCION

%==================================================
%Trapecio Compuesto
disp('============================================')
disp('Calculo con Trapezoidal Compuesta')
Tc = trapcomp(F,a,b,L+5)
%==================================================
%Simpson Compuesto
disp('============================================')
disp('Calculo con Simpson Compuesta')
Sc = simpcomp(F,a,b,L+5)

%==================================================
%Cuadratura de Gauss con n = 3
disp('============================================')
disp('Calculo con Cuadratura de Gauss')
Q=cuad_gauss_c(F,a,b,L,n)

disp('============================================')
disp('Calculo con cuadratura de Octave funcion quad')

%Funcion quad de octave
q = quad(F,a,b)
