% A=normalizar_variable(matriz,varargin)
% Divide todos los elementos de una matriz por los numeros colocados en los
% argumetos.
% ENTRADA:
%   matriz: matriz de tama�o [m�n�o] donde m,n y o son mayores a cero.
%   varargin: estos pueden ser argumentos variables separados por coma (,).
%   Cada agumento debe ser un elemento num�rico (double o int) de tama�o
%   [1�1].
% SALIDA
%   A: Es una matriz con el mismo tama�o que la entrada, pero sus elementos
%   fueron divididos por todos los argumentos del varargin.
% EJEMPLO
%   Normalizar el momento articular de la cadera derecha en funcion del 
%   peso y altura del sujeto en estudio:
%   A=normalizar_variable(MomentoRodillaDerechaEjesAnatomicos,1.79,83)
% 
% Autor: Marcos Dominguez
% Abril 2019

function A=normalizar_variable(matriz,varargin)
A=matriz;
for i=1:nargin-1
    A=A/varargin{1,i};
end
end