% A=recorrer(estructura,funcion,varargin)
% 
% Funcion que reccorre una estructura y ejecuta la función sobre los
% campos al final de la cadena de la estructura.
% Un Campo fial es aquel campo que no es una estructura, por lo que
% no se desglosa en nuevos campos.
% La función recorrer solo sirve con funciones donde los campos finales 
% de la estructura deben estar como primer argumento de la función. 
% ENTRADA
%   estructura: es una estructura de campos variables. Es importante que
%   todos los campos finales sean del tipo que requiere la función como 
%   primer argumento.
%   varagin: son los argumentos adicionales que necesita la funcion, en el
%   mismo orden que se ingresan a la función. Si la función no tiene
%   argumentos adicionales a la variable de la estructura puede no
%   utilizarse este argumento.
% SALIDA
%   A: es una estructura con el mismo formato que la estrucutra de entrada,
%   pero con los elementos de los campos finales modificados segun la
%   función.
% EJEMPLO
%   MARCADORES_DERIVADOS=recorrer(MARCADORES,'derivada_vectores',dt)
% 
% Autor: Marcos Dominguez
% Enero 2016
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
