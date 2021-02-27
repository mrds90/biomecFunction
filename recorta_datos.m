% [ESTRUCTURA] = recorta_datos(ESTRUCTURA,PrimerMuestra,UltimaMuestra)
% 
% Recorre los campos de una estructura y recorta todas las primeras 
% dimensiones (filas) de la matriz entre los indices elegidos en el 
% argumento
% ENTRADA
%   ESTRUCTURA: es una estructura cuyos campos finales son una matriz de
%   tamaño [n×m]. Todas las matrices deben tener al menos la misma cantidad
%   de filas que se ingresa como UltimaMuestra.
%   PrimeraMuestra: Corresponde a numero de fila elegido como inicial para
%   las nuevas matrices recortadas. Es del tipo int y de tamaño [1×1].
%   UltimaMuestra: Corresponde a numero de fila elegido como final para
%   las nuevas matrices recortadas. Es del tipo int y de tamaño [1×1].
% SALIDA
%   ESTRUCTURA: Es una estructura con el mismo formato que la de entrada,
%   pero las matrices de sus campos finales tienen una cantidad de filas
%   igual a UltimaMuestra-PrimeraMuestra+1. Las matrices finales son
%   iguales a las matrices originales entre la fila PimeraMuestra y
%   UltimaMuestra.
% EJEMPLO
%   MARCADORES_RECORTADOS=recorta_datos(MARCADORES,RHS1-10,LHS2+10)
% 
% Autor: Marcos Dominguez
% Agosto 2020
%--------------------------------------------------------------------------
function [ESTRUCTURA] = recorta_datos(ESTRUCTURA,PrimerMuestra,UltimaMuestra)
    if isstruct(ESTRUCTURA)
            Subnivel=fieldnames(ESTRUCTURA);
            for Cont=1:size(Subnivel,1)
                Sub=char(Subnivel{Cont});
                ESTRUCTURA.(sprintf('%s',Sub))=recorta_datos(ESTRUCTURA.(sprintf('%s',Sub)),PrimerMuestra,UltimaMuestra);
                disp(sprintf('            se recorto el campo %s',Sub))

            end
    else
        ESTRUCTURA=ESTRUCTURA(PrimerMuestra:UltimaMuestra,:); % guardo la porción de señal entre PrimeraMuestra y UtilmaMuestra en la variable que devuelve la función
    end
end
