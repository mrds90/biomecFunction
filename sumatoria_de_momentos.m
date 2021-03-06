% momentoResultante=sumatoria_de_momentos(centroDeMomento,d1HGlobal,momentoDistalGlobal,varargin)
% 
% La funci�n recibe el centro de momento, la variacion de cantidad de
% movimiento angular, el momento distal (o arbitrario en el caso del pie) y los pares de fuerza + punto de
% aplicacion.
% ENTRADA
%   centroDeMomento: es la ubicaci�n en el espacio del centro de masa del
%   segmento en estudio. Sus elementos son del tipo double y su tama�o es
%   de n�3 (con n mayor o igual a 1 y tipicamente la cantidad de frames en
%   estudio). Cada fila de esta variable es la ubicacion en el espacio del
%   centro de masa, en metros, para un frame.
%   d1HGlobal: es la variacion de cantidad de movimento angular en terminos
%   del sitema coordenado global. El tama�o de esta variable debe ser igual
%   al de la variable "centroDeMomento".
%   momentoDistalGlobal: es el momento en terminos del sistema coordenado
%   global que se ejerce distal al segmento en estudio (o el arbitrario en 
%   el caso del pie). El tama�o debe ser igual al del argumento
%   "centroDeMomento" y sus elementos son de tipo double. La unidad de esta
%   variable es N�m y cada fila de esta variable representa al vector de
%   momento para un frame determinado.
%   varagin: esta es la forma en la que matlab perimte ingresar a la
%   funci�n con una cantidad variable de argumentos. Para esta funci�n la
%   cantidad de argumentos variables deben ser siempre multiplos de dos. 
%   Estos argumentos se ingresan de a pares, donde el primero corresponde a
%   una fuerza y el segundo al punto de aplicaci�n de esa fuerza. Tanto la
%   variable que representa la fuerza (en Newtons) y la que representa el
%   punto de aplicaci�n (en metros) tendr�n elementos del tipo double y el
%   mismo tama�o que la variable "centroDeMasaDelPie".
% SALIDA
%   momentoResultante: es una matriz del mismo tama�o que la variable
%   "centroDeMomento" donde cada fila, de esta, representa el momento
%   necesario para balancear la sumatoria de momentos en un frame en 
%   t�rminos del sistema coordenado global. Sus valores estan en N�m y sus 
%   elementos son del tipo double. Tipicamente este momento ser� el de la 
%   articulaci�n proximal del segmento en estudio.
% EJEMPLO
%   para en el pie:
%       momentoDelTobillo=sumatoria_de_momentos(centroDeMasaDelPie,d1HDelPieEnSistemaGlobal,TzPlataforma,FuerzaPlataforma,centroDePresion,FuerzaDeTobillo,centroArticularTobillo)
%   en el ejemplo vemos que cada fuerza tiene como siguiente argumento su
%   punto de aplicaci�n(varargin son pares de: fuerza , punto de aplicacion)
%   devuelve el momento necesario para balancear la sumatoria de momentos.
% 
% Autor: Marcos Dominguez
% Noviembre 2020
function momentoResultante=sumatoria_de_momentos(centroDeMomento,d1HGlobal,momentoDistalGlobal,varargin)
    momentoResidual=momentoDistalGlobal;
    for i=1:2:length(varargin)
        momentoResidual=momentoResidual+cross(varargin{1,i+1}-centroDeMomento,varargin{1,i});
    end
    momentoResultante= d1HGlobal-momentoResidual;
end