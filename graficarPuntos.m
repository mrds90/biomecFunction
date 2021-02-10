% Autor: Marcos Dominguez
% Noviembre 2020

function graficarPuntos(color,frame,varargin)
for cont=1:nargin-2
scatter3(varargin{1,cont}(frame,1),varargin{1,cont}(frame,2),varargin{1,cont}(frame,3),sprintf('%s',color))
hold on
end