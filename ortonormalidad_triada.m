% Controla que los tres versores de entradas sean perpendiculares entre si 
% y que el modulo de cada versor sea 1 en todos los frames. (sirve para 
% matrices de Frames×3, no valido para matrices de 3×Frames).
% ENTRADA
%   v1, v2 y v3: son matrices de tamaño [n×3] donde n es entero y mayor a
%   0. Las filas de estas matrices son versores. v1,v2 y v3 deberian ser
%   versores perpendiculares entre si.
% SALIDA
%   La función reporta por display si los versores v1, v2 y v3 son
%   perpendiculares entre si y tienen modulo 1. En caso de que no lo 
%   sean por display se reporta el motivo por el que no cumplen con la 
%   ortonormalidad.
% EJEMPLO
% verificar si i,j y k del muslo derecho son versores (modulo 1) y 
% perpendiculares entre si:
%   ortonormalidad_triada(iMusloDerecho,jMusloDerecho,kMusloDerecho)
% 
% Autor: Marcos Dominguez
% Agosto 2020
function ortonormalidad_triada(v1,v2,v3)
% el producto punto de dos versores perpendiculares es igual a cero. Lo
% usamos para verificar perpendicularidad.
A=max(abs(dot(v1,v2,2)));%Evaluo entre todos los frames cual es el valor absoluto máximo del producto punto entre v1 y v2
B=max(abs(dot(v1,v3,2)));%Evaluo entre todos los frames cual es el valor absoluto máximo  producto punto entre v1 y v3
C=max(abs(dot(v2,v3,2)));%Evaluo entre todos los frames cual es el valor absoluto máximo  producto punto entre v2 y v3
D=max([A,B,C]); % D es el valor absoluto mas alto del producto punto entre todos los productos punto en todos los frames
% si este elemento es distinto de cero significa que no hay perpendicularidad entre los versores en
% todos los frames. Se usa una tolerancia por errores de rendondeo en
% matlab (10^-14 es la tolerancia).
if D>(10^-14) % D mayor a 0?
    modulos=[calculaModulo(v1);calculaModulo(v2);calculaModulo(v3)]; % calculo el módulo de los tres versores en todos los frames y lo coloco en una sola matriz.
    if min(modulos)>0.999999999999999&& max(modulos)<1.00000000000001 % Condición de módulos igual a 1.
        disp('             Los vectores no son perpendiculares y sus modulos son igual a 1')
    else % Condición de módulos distinto de 1.
        disp('             Los vectores no son perpendiculares y sus modulos son distinto de 1')
    end
else %condición de D = 0
    modulos=[calculaModulo(v1);calculaModulo(v2);calculaModulo(v3)];
    if min(modulos)>0.999999999999999&& max(modulos)<1.00000000000001 % Condición de módulos igual a 1.
        disp(sprintf('            Los vectores son ortonormales \n'))
    else % Condición de módulos distinto de 1.
        disp('             Los vectores son perpendiculares y sus modulos son distinto de 1')
    end
end
end