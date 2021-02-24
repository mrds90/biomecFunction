% Autor: Marcos Dominguez
% Noviembre 2020
% Explora, utilizando recursividad, los elementos de una estructura y devuelve el valor m�ximo entre
% todos los elementos.
% ENTRADA
%   ESTRUCTURA: es una estructura con campos variables. La unica condici�n
%   de la estructura es que en sus campos finales solo haya elementos
%   numericos (no importa la cantidad de dimensiones).
% SALIDA
%   MaximoAbsoluto: es un valor numerico de tama�o [1�1] que corresponde al
%   elemento de mayor valor entre todos los elementos de la estructura.



function MaximoAbsoluto=maximo_struct(ESTRUCTURA)
if isstruct(ESTRUCTURA)
        Subnivel=fieldnames(ESTRUCTURA);
        for Cont=1:size(Subnivel,1)
            Sub=char(Subnivel{Cont});
%             disp(sprintf('%s',Sub))
            Maximo(Cont)=maximo_struct(ESTRUCTURA.(sprintf('%s',Sub)));
        end
        MaximoAbsoluto=max(Maximo);
else
   MaximoAbsoluto=max(max(max(ESTRUCTURA)));
end
end