% versor=versor_con_dos_puntos(cabeza,cola)
% 
% Calcula el versor con direcci�n coincidente al segmento de recta entre
% los puntos "cabeza" y "cola".El sentido del versor es desde "cola" a 
% "cabeza".
% ENTRADA
%   cabeza: es una matriz de tama�o [3�n] o [n�3] con n mayor o igual que
%   uno que representa un punto en el espacio para n frames.
%   cola: es una matriz de tama�o [3�n] o [n�3] con n mayor o igual que
%   uno que representa un punto en el espacio para n frames.
% SALIDA
%   el una matriz cuyas filas o columnas (segun entrada) representan
%   versores. Estos versores son paralelos al segmento de recta que une los
%   puntos cabeza y cola en cada frame, y estan orientados hacia la cabeza.
% EJEMPLO
%   vPelvis=versor_con_dos_puntos(Marcador.l_asis,Marcador.r_asis)
% 
% Autor: Marcos Dominguez
% Noviembre 2020
function versor=versor_con_dos_puntos(cabeza,cola)
vector=cabeza-cola;
versor=convierteVectorAVersor(vector);
end