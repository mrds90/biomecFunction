%--- Recorre los campos de una estructura y recorta todas las primeras dimensiones (filas) de la matriz entre los indices elegidos en el argumento ---------------
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
