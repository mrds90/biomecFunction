% A=filtrar_estructutra(estructura,a,b)
% Funcion que reccorre una estructura y ejecuta la función filtfilt sobre los
% elementos al final de la cadena de la estructura con los argumentos a y
% b.
% ENTRADAS
%   estructura: estructura cuyos campos finales son vectores o matrices con
%   elementos numericos.
%   a: coeficientes del denominador del filtro butter.
%   b: coeficientes del numerador del filtro butter.
% SALIDA
%   A: es un struct de formato idéntico a la variable "estructura", cuyas
%   matrices estan filtradas con la funcion filtfilt y los vectores de
%   coeficientes a y b
% EJEMPLO
%   MARCADORES_FILTRADOS=filtrar_estructutra(MARCADORES,[1.00,0.04,0.9],[0.9,0.98,0.87])
% 
% Autor: Marcos Dominguez
% Noviembre 2020

function A=filtrar_estructutra(estructura,a,b)
    if isstruct(estructura)
            Subnivel=fieldnames(estructura);
            for Cont=1:size(Subnivel,1)
                Sub=char(Subnivel{Cont});
                disp(sprintf('      - %s:',Sub))
                A.(sprintf('%s',Sub))=filtrar_estructutra(estructura.(sprintf('%s',Sub)),a,b);
            end
        else
            if ~isnan(sum(sum(estructura)))
            A=filtfilt(a,b,estructura);
            disp('         filtrada')
            else
            A=estructura;
            disp('         NO filtrada')
            end
            A(isnan(A))=0;
    end
end