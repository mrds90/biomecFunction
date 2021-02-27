% graficarPuntos(color,frame,varargin)
% Permite graficar en un volumen 3d un punto o varios puntos
% correspondientes a un mismo frame con el color deseado a partir de las
% matrices de posición de dichos puntos.
% ENTRADA
%   color: es una variable char [1×1] que define el color. las opciones son
%   iguales a las de la función plot (ej: 'r' para rojo,'g' para verde,'b'
%   para azul,'k' para negro,'c' para cian, etc).
%   frame: numero de fila de las matrices de posición que queremos evaluar.
%   varargin: es la forma que tiene matlab para determinar cantidad de
%   entradas variables. Cada entrada se separa por una coma y debe ser una
%   matriz de tamaño [n×3] y que en sus filas estan representadas las 
%   posiciones en el espacio para cada frame.
% SALIDA
%   Grafica en una figura de los puntos elegidos en el espacio.
% EJEMPLO
% graficarPuntos('r',EVENTO.RHS1,MARCADORES.r_asis,MARCADORES.r_knee1,MARCADORES.r_heel)
% 
% Autor: Marcos Dominguez
% Noviembre 2020





function graficarPuntos(color,frame,varargin)
for cont=1:nargin-2
scatter3(varargin{1,cont}(frame,1),varargin{1,cont}(frame,2),varargin{1,cont}(frame,3),sprintf('%s',color))
hold on
end