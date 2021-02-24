% Explora, utilizando recursividad, los elementos de una estructura y devuelve el valor m�mimo entre todos los elementos
% ENTRADA
%   ESTRUCTURA: es una estructura con campos variables. La unica condici�n
%   de la estructura es que en sus campos finales solo haya elementos
%   numericos (no importa la cantidad de dimensiones).
% SALIDA
%   MinimoAbsoluto: es un valor numerico de tama�o [1�1] que corresponde al
%   elemento de menor valor entre todos los elementos de la estructura.
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
    