% SenialSubmuestreada=submuestrear(Senial,Salto)
% 
% La funci�n submuestrea una matriz o todos los campos de una etructura. 
% Devuelve una estructura con el mismo formato donde todos sus campos fueron
% submestreados segun el salto seteado. El submuestreo es respecto a las
% filas de los campos finales, es decir que los campos de salidas tendran
% la misma cantidad de columnas y menor cantidad de filas.
% ENTRADA
%   Senial: Puede ser del tipo struct, matriz de [n�m] o vector de [n�1].
%   En el caso de que la entrada sea una estructura se submuestrean los 
%   campos finales de la misma. Todos los campos finales deben tener 
%   formato num�rico y tipicamente ser�n de tama�o [muestras�1] o 
%   [muestras�3]. 
%   Salto: Es una variable del tipo int y tama�o [1�1] que determina cada
%   cuantas filas se toma una muestra.
% SALIDA
%   SenialSubmuestreada: Es una variable del mismo formato que la variable
%   "Senial". Los campos de tipo matriz de la variable "Senial" se
%   submuestrean respecto a la fila. Las matrices de la SenialSubmuestreada
%   posee los elementos de todas las filas que satifacen fila=1+n�Salto con
%   n= 0, 1, 2, ..., N. Donde N es la cantidad de filas que tiene la matriz 
%   que se submuestrea.
% EJEMPLO
% Submuestrear los datos dinamicos de la plataforma 1 del c3d
%   DATOS.Dinamica.Plataforma1.ValoresSubmuestreados=submuestrear(DATOS.Dinamica.Plataforma1.Valores,3)
% 
% Autor: Marcos Dominguez
% Noviembre 2020
function SenialSubmuestreada=submuestrear(Senial,Salto)
if isstruct(Senial)
        Subnivel=fieldnames(Senial);
        for Cont=1:size(Subnivel,1)
            Sub=char(Subnivel{Cont});
            SenialSubmuestreada.(sprintf('%s',Sub))=submuestrear(Senial.(sprintf('%s',Sub)),Salto);
            disp((sprintf('    submuestreando %s',Sub)));
            
        end
else
    SenialSubmuestreada=Senial(1:Salto:length(Senial),:);
end
