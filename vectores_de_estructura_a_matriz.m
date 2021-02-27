% [Matriz]=vectores_de_estructura_a_matriz(ESTRUCTURA)
% 
% recorre los campos de una estructura (que sean vectores) y devuelve una 
% matriz compuesta por los vectores.
% Convierte los campos de una estructura en un vector/matriz de n×m, donde
% n es la cantidad de elementos que tiene cada campos de la estructura y m
% es la cantidad de campos que tiene la estructura. La estructura debe
% tener campos del tipo numérico, todos los campos deben tener la misma
% cantidad de elentos (n) y formato [1×n].
% ENTRADA
%   ESTRUCTURA: es una estrutura con m cantidad de campos, cuyos campos son
%   vectores filas con n elementos numericos. n es mayor o igual a uno. 
%   Todos los campos de la estructura deben tener el mismo tamaño.
% SALIDA
%   Matriz: es una matriz de m×n donde m es igual a la cantidad de
%   campos de la variable "ESTRUCTURA" y n es la cantidad de elementos que
%   tiene cada campo de la variable "ESTRUCTURA". El orden de las filas es
%   correspondiente con el orden de los campos de la estructura.
% EJEMPLO
%   Estructura EVENTO a vector con los Eventos:
%   [VectorEventos]=vectores_de_estructura_a_matriz(EVENTO)
%   si la estructura EVENTO tiene los campos:
%       - R_HS1 = 10
%       - R_TOE = 180
%       - R_HS2 = 317
%       - L_HS1 = 120
%       - L_TOE = 420
%       - L_HS2 = 572
%   VectorEventos: será un vector de tamaño [6×1] cuyos elementos seran:
%   10, 180, 317, 120, 420 y 572.
% 
% Autor: Marcos Dominguez
% Noviembre 2020

function [Matriz]=vectores_de_estructura_a_matriz(ESTRUCTURA)

Subnivel=fieldnames(ESTRUCTURA);
for cont=1:size(Subnivel,1)% de 1 a la cantidad de elemntos que tiene la estructura
    sub=char(Subnivel{cont}); % Rescato nombre del campo correspondiete al ciclo del for.
    Matriz(:,cont)=ESTRUCTURA.(sprintf('%s',sub));

end
