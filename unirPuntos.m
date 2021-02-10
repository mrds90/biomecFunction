% Autor: Marcos Dominguez
% Noviembre 2020

function unirPuntos(color,frame,varargin)
a=[NaN NaN NaN];
for cont=1:nargin-2
a=[a ; varargin{1,cont}(frame,:)];
end
plot3(a(:,1),a(:,2),a(:,3),color)
end