% Autor: Marcos Dominguez
% Noviembre 2020
% Recibe como parámetros masa (escalar), aceleración (vector si es un frame
% o matriz si son varios frames) y fuerzas (vector si es un frame o matriz 
% si son varios frames) y devuelve el valor de la fuerza resultante
% (la fuerza resultante es la necesaria para balancear la sumatoria de fuerzas)
% contempla el peso del segmento en la sumatoria.

function fuerzaResultante=sumatoria_de_fuerzas(masa,aceleracion,varargin)
frames=length(aceleracion); % evalúo la cantidad de frames
gravedad=[ zeros(frames,2) , -9.8*ones(frames,1)]; %defino vector gravedad para todos los frames
s=[varargin{1,1}];%extraigo el valor de la primera fuerza cargada en la función.
for i=2:nargin-2
    s=s+[varargin{1,i}];%sumo todas las fuerzas
end
fuerzaResultante=masa*aceleracion-masa*gravedad-s;%despejo la fuerza resultante.
end