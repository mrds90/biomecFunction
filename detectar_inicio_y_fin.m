% Autor: Marcos Dominguez
% Noviembre 2020
% Funcion que busca los indices donde se garantiza que entre esos dos frames 
% no hay ningun NaN entre todos los marcadores 
% ENTRADA
% MARCADORES: estructura que tiene como campos las matrices de marcadores
% en un formato [n×3].
% SALIDA
%   PrimerDato: Expresa cual es el minimo indice (frame) que garantiza la
%   ausencia de NaN para TODOS los marcadores hasta que terminen los dos
%   ciclos. Es un numero entero (int) de tamaño 1×1. Es decir, antes de
%   este indice hay algun marcador que toma el valor NaN.
%   UltimoDato: Expresa cual es el maximo indice (frame) que garantiza la
%   ausencia de NaN para TODOS los marcadores luego de que terminen los dos
%   ciclos. Es un numero entero (int) de tamaño 1×1. Es decir, despues de
%   este indice hay algun marcador que toma el valor NaN.
% Esta función ignora los centros de presión (ultimos dos marcadores) para
% el analisis.
function [PrimerDato , UltimoDato]=detectar_inicio_y_fin(MARCADORES)
Subnivel=fieldnames(MARCADORES);% obtengo los nombres de los marcadores
Tamano=length(Subnivel); %cuento la cantidad de elementos
for Cont=1:Tamano-2 % recorro hasta Tamano-2 porque los ultimos dos son los centros de presión y no quiero que influyan su mayor cantidad de NaN.
    Sub=char(Subnivel{Cont}); %extraigo el nombre de el marcador que corresponda para el ciclo del for.
    [Primero(Cont), ~]=find(~isnan(MARCADORES.(sprintf('%s',Sub))),1,'first'); %guardo en vector el indice del primer elenmento no NaN de este marcador.
    [Ultimo(Cont), ~]=find(~isnan(MARCADORES.(sprintf('%s',Sub))),1,'last'); %guardo en vector el indice del último elenmento no NaN de este marcador.
end
PrimerDato=max(Primero); %el mayor del vector Primero garantiza que antes no hay NaN entre todos los marcadores.
UltimoDato=min(Ultimo); %el menor del vector Ultimo garantiza que despues no hay NaN entre todos los marcadores.
end