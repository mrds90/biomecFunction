% MinimoAbsoluto=minimo_struct(ESTRUCTURA)
% 
% Explora, utilizando recursividad, los elementos de una estructura y devuelve el valor mímimo entre todos los elementos
% ENTRADA
%   ESTRUCTURA: es una estructura con campos variables. La unica condición
%   de la estructura es que en sus campos finales solo haya elementos
%   numericos (no importa la cantidad de dimensiones).
% SALIDA
%   MinimoAbsoluto: es un valor numerico de tamaño [1×1] que corresponde al
%   elemento de menor valor entre todos los elementos de la estructura.
% EJEMPLO
% PRIMER_EVENTO=minimo_struct(EVENTOS)
% Donde EVENTOS tiene los campos:
%       - R_HS1 = 10
%       - R_TOE = 180
%       - R_HS2 = 317
%       - L_HS1 = 120
%       - L_TOE = 420
%       - L_HS2 = 572
% y PRIMER_EVENTO es igual a 10
% 
% Autor: Marcos Dominguez
% Noviembre 2020

function MinimoAbsoluto=minimo_struct(ESTRUCTURA)
if isstruct(ESTRUCTURA)
        Subnivel=fieldnames(ESTRUCTURA);
        for Cont=1:size(Subnivel,1)
            Sub=char(Subnivel{Cont});
%             disp(sprintf('%s',Sub))
            Minimo(Cont)=minimo_struct(ESTRUCTURA.(sprintf('%s',Sub)));
        end
        MinimoAbsoluto=min(Minimo);
else
   MinimoAbsoluto=min(min(min(ESTRUCTURA)));
end
end
    