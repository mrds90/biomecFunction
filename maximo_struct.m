% MaximoAbsoluto=maximo_struct(ESTRUCTURA)
% Explora, utilizando recursividad, los elementos de una estructura y devuelve el valor máximo entre
% todos los elementos.
% ENTRADA
%   ESTRUCTURA: es una estructura con campos variables. La unica condición
%   de la estructura es que en sus campos finales solo haya elementos
%   numericos (no importa la cantidad de dimensiones).
% SALIDA
%   MaximoAbsoluto: es un valor numerico de tamaño [1×1] que corresponde al
%   elemento de mayor valor entre todos los elementos de la estructura.
% EJEMPLO
% UTLIMO_EVENTO=maximo_struct(EVENTOS)
% Donde EVENTOS tiene los campos:
%       - R_HS1 = 10
%       - R_TOE = 180
%       - R_HS2 = 317
%       - L_HS1 = 120
%       - L_TOE = 420
%       - L_HS2 = 572
% y ULTIMO_EVENTO es igual a 572
% 
% Autor: Marcos Dominguez
% Noviembre 2020


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