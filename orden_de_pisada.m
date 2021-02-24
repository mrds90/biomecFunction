% Autor: Marcos Dominguez
% Noviembre 2020
% detecta en función de los valores de los heel contact iniciales el orden
% de pisada e los miembros.
% ENTRADA
%   rhs1 y lhs1: son los valores en frame o tiempo de heel contact
%   iniciales para el miembro derecho e izquierdo. Son datos numéricos
%   (double o int) y de tamaño [1×1].
% SALIDA
%   contactos: es una variable de tipo cell {1×2} que tiene como elementos
%   dos char. El cell es {'r','l'} si primero sucede el ciclo derecho y
%   {'l','r'} si primero sucede el cicl izquierdo.

function contactos=orden_de_pisada(rhs1,lhs1)
    if (rhs1 < lhs1) 
        contactos = {'r','l'};
    else
        contactos = {'l','r'};
    end
end