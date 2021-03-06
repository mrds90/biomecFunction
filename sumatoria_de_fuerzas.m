% fuerzaResultante=sumatoria_de_fuerzas(masa,aceleracion,varargin)
% 
% Recibe como par�metros masa (escalar), aceleraci�n (vector si es un frame
% o matriz si son varios frames) y fuerzas (vector si es un frame o matriz 
% si son varios frames) y devuelve el valor de la fuerza resultante
% (la fuerza resultante es la necesaria para balancear la sumatoria de fuerzas)
% contempla el peso del segmento en la sumatoria.
% ENTRADA
%   masa: peso del segmento en estudio en Kilogramos. Es del tipo num�rico
%   y tama�o [1�1]
%   aceleracion: es la aceleraci�n lineal (representaci�n vectorial) del 
%   centro de masa del segmento en estudio. Su tama�o es de [n�3] donde n
%   toma valores mayor o igual a 1 (es tipicamente la cantidad de frames en
%   estudio). Cada fila de esta variable es el vector aceleraci�n para un
%   frame. La unidad de esta variable es m/s^2
%   varagin: es la o las fuerzas que se aplican sobre el segmento en
%   estudio. El formato es del tipo num�rico y debe tener el mismo fotmato
%   que la variable de entrada "aceleracion". varargin es la forma de
%   definir una variable con catidad de argumentos variable. Por lo tanto
%   podemos entrar a la funcion con una cantidad variable de fuerzas, donde
%   cada fuerza es un argumento independiente separado por coma (,) en la
%   llamada de la funci�n. Cada fila de esta variable es un vector fuerza
%   aplicado al segmento en estudio para un frame. La unidad de esta 
%   variable es Newton
% SALIDA
%   fuerzaResultante: es una matriz del mismo tama�o que la variable
%   "aceleraci�n" donde cada fila, de esta, representa la fuerza necesaria 
%   para balancear la sumatoria de fuerzas en un frame. Sus valores estan
%   en Newton y sus elementos son del tipo double. Tipicamente esta fuerza
%   ser� la fuerza en la articulaci�n proximal del segmento.
% EJEMPLO
%   fuerzaRodilla=sumatoria_de_fuerzas(masaPierna,aceleracionCMPierna,-FuerzaTobillo)
% 
% Autor: Marcos Dominguez
% Noviembre 2020
function fuerzaResultante=sumatoria_de_fuerzas(masa,aceleracion,varargin)
frames=length(aceleracion); % eval�o la cantidad de frames
gravedad=[ zeros(frames,2) , -9.8*ones(frames,1)]; %defino vector gravedad para todos los frames
s=[varargin{1,1}];%extraigo el valor de la primera fuerza cargada en la funci�n.
for i=2:nargin-2
    s=s+[varargin{1,i}];%sumo todas las fuerzas
end
fuerzaResultante=masa*aceleracion-masa*gravedad-s;%despejo la fuerza resultante.
end