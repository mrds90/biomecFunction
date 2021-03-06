% unirPuntos(color,frame,varargin)
% 
% funci�n que permite graficar en el espacio 3d lineas que unen puntos de
% ese espacio para un frame determinado. Es util para representar segmentos
% formados por dos centros articulares o dibujar el miembro inferior 
% completo para un frame determinado.
% ENTRADA
%   color: es una variable del tipo char de tama�o [1�1] y es el mismo
%   argumento que se utiliza en un plot para asinar color. Ejemplos de 
%   colores: 'r', 'g', 'b', 'c', entre otros.
%   frame: corresponde al numero de frame (fila de la matriz) que se desea
%   graficar. es una variable del tipo int y tama�o [1�1].
%   varargin: es la forma que tiene matlab para definir una cantidad
%   variable de entradas. Estas variables de entrada seran matices de 
%   tama�o [n�3] cuyos elementos son del tipo double. n es tipicamente la
%   cantidad de frames. Se requieren de al menos dos matrices para que la
%   funcion pueda representar un segmento de recta entre dos puntos.
% SALIDA
%   la salida de la funci�n es una grafica en el espacio 3d donde se unen
%   los puntos que estan definido en la fila "frame" de todas las matrices 
%   de la entrada (argumentos del varargin). El orden en el que se trazan
%   las lineas se corresponde con el orden en el que se ingresan las
%   matrices del varargin a la funci�n.
% EJEMPLO
%   dibujo de segmento pierna y muslo derecho en el espacio para el frame 10 
%   en color rojo:
%       unirPuntos('r',10,CentroArticularTobilloDerecho,CentroArticularRodillaDerecha,CentroArticularCaderaDerecha)
%   donde CentroArticularTobilloDerecha, CentroArticularRodillaDerecha y 
%   CentroArticularCaderaDerecha son matrices de tama�o [frames�3] y
%   sus filas representan a la ubicaci�n en el espacio de los centros 
%   articulares (de tobillo, rodilla y cadera respectivamente) para cada 
%   frame.
% 
% Autor: Marcos Dominguez
% Noviembre 2020

function unirPuntos(color,frame,varargin)
a=[NaN NaN NaN];
for cont=1:nargin-2
a=[a ; varargin{1,cont}(frame,:)];
end
plot3(a(:,1),a(:,2),a(:,3),color)
end