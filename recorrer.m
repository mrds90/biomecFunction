% Autor: Marcos Dominguez
% Enero 2016
% Funcion que reccorre una estructura y ejecuta la función sobre los
% elementos al final de la cadena de la estructura
function A=recorrer(estructura,funcion,varargin)
    if isstruct(estructura)
        Subnivel=fieldnames(estructura);
        for cont=1:size(Subnivel,1)
            Sub=char(Subnivel{cont});
            if nargin==2
                A.(sprintf('%s',Sub))=recorrer(estructura.(sprintf('%s',Sub)),funcion);
                else
                A.(sprintf('%s',Sub))=recorrer(estructura.(sprintf('%s',Sub)),funcion,varargin{1,:});
            end
        end
    else
        argumentoFuncion='(estructura';
        if nargin==2 %CASO QUE NO HAY LA FUNCION NO TENGA ARGUMENTO)
             argumentoFuncion=(sprintf('%s)',argumentoFuncion));
        else
            if nargin>3 %CASO QUE LA FUNCION TENGA 2 O MAS VARIABLES DE ENTRADA)
                argumentoFuncion='(estructura,';
                for cont2=1:nargin-3
                    argumentoFuncion=(sprintf('%s%d,',argumentoFuncion,varargin{1,cont2}));
                end
            else
                cont2=0; %CASO QUE LA FUNCION TENGA SOLO 1 VARIABLE DE ENTRADA )
                argumentoFuncion=(sprintf('%s,',argumentoFuncion));
            end
            argumentoFuncion=(sprintf('%s%d)',argumentoFuncion,varargin{1,cont2+1}));
        end
            A=eval(sprintf('%s%s',funcion,argumentoFuncion));
    end
end
