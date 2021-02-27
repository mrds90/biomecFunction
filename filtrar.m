% ESTRUCTURA_FILTRADA=filtrar(fc,orden,MARCADORES,frecuenciaDeMestreo)
% 
% Filtrado Butterworth de los elementos de una Estructura (MARCADORES)
% donde se define la frecuencia de corte y el orden del filtro. La función
% requiere la frecuencia de muestreo para definir el filtro digital.
% ENTRADA
%   fc: frecuencia de corte deseado, del tipo int o double en Hz.
%   orden: es el orden deseado del filtro, del tipo int y adimencional.
%   MARCADORES: estructura cuyos campos son matrices con distintos
%   marcadores. Cada campo tiene tamaño [n×3].
%   frecuenciaDeMuestreo: es la frecuencia de muestreo de las señales. De
%   tamaño [1×1] y tipo de dato numérico (double o int).
% SALIDA
%   ESTRUCTURA_FILTRADA: es una estructra con los mismos campos que
%   MARCADORES cuyas matrices fueron filtradas en función de los
%   parametros deseados. El tamaño de las matrices se conserva pero cambian
%   los valores de sus elementos.
% EJEMPLO
%   Aplicar filtro butterworth pasa bajos con frecuncia de corte 8 y de 
%   orden dos en ambos sentidos a marcadores adquiridos a 340 hz:
%      MARCADORES_FILTRADOS=filtrar(8,2,MARCADORES,340)
% 
% Autor: Marcos Dominguez
% Abril 2019

function ESTRUCTURA_FILTRADA=filtrar(fc,orden,MARCADORES,frecuenciaDeMestreo)
Wc=2*fc/frecuenciaDeMestreo; % frecuencia de corte normalizada
[a,b] = butter(orden,Wc);
ESTRUCTURA_FILTRADA=filtrar_estructutra(MARCADORES,a,b);
end