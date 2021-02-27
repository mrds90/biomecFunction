% versor=convierteVectorAVersor(vector)
% 
% Calcula los versores de cada cuadro a partir de los vectores de cada
% cuadro.
% ENTRADA
%   vector: es una matriz de 3×n o n×3, donde en n es un valor entero 
%   mayor o igual que 1. Las columnas o filas de tamaño 3 corresponden a los
%   vectores que se utilizaran para calcular su versor.
% SALIDA
%   versor: es una matriz del mismo tamaño que la entrada, cuyas
%   filas o columnas de tamaño 3 (segun entrada) son versores
%   coorrespondiente al vector del frame (o cuadro) de la variable "vector".
% EJEMPLO
% vPelvis=conviereVectorAVersor(Marcador.l_asis-Marcador.r_asis)
% 
% Autor: Marcos Dominguez
% Noviembre 2020
function versor=convierteVectorAVersor(vector)
    modulo=calculaModulo(vector);
    if 3==length(vector(1,:))
        modulo=[modulo,modulo,modulo];
    else
        if  length(vector(:,1))==3
        modulo=[modulo;modulo;modulo];
        else
        disp('Error: tamaño de matriz incorrecta')
        end
    end
    versor=vector./modulo;
end