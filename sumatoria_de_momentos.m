% Autor: Marcos Dominguez
% Noviembre 2020
% La función recibe el centro de momento, la variacion de cantidad de
% movimiento angular, el momento distal (o arbitrario en el caso del pie) y los pares de fuerza + punto de
% aplicacion.
% Ejemplo para fuerza en el pie:
% sumatoria_de_momentos(centroDeMasaDelPie,d1HDelPieEnSistemaGlobal,TzPlataforma,FuerzaPlataforma,centroDePresion,FuerzaDeTobillo,centroArticularTobillo)
%en el ejemplo vemos que cada fuerza tiene como siguiente argumento su
%punto de aplicación(varargin es son pares de fuerza + punto de aplicacion)
%devuelve el momento necesario para balancear la sumatoria de momentos.
function momentoResultante=sumatoria_de_momentos(centroDeMomento,d1HGlobal,momentoDistalGlobal,varargin)
    momentoResidual=momentoDistalGlobal;
    for i=1:2:length(varargin)
        momentoResidual=momentoResidual+cross(varargin{1,i+1}-centroDeMomento,varargin{1,i});
    end
    momentoResultante= d1HGlobal-momentoResidual;
end