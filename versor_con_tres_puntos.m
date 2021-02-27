% versor=versor_con_tres_puntos(cabeza1,cabeza2,cola)
% 
% Calcula el versor con dirección perpendicular al plano formado por los
% tres puntos.
% Cola es el punto común a los dos versores calculados y el sentido respeta
% la regla de la mando derecha para el producto cruz entre el versor que
% tiene a cabeza1 por el que tiene cabeza2.
% ENTRADA
%   cabeza1: es una matriz de tamaño [3×n] o [n×3] con n mayor o igual que
%   uno que representa un punto en el espacio para n frames.
%   cabeza2: es una matriz de tamaño [3×n] o [n×3] con n mayor o igual que
%   uno que representa un punto en el espacio para n frames.
%   cola: es una matriz de tamaño [3×n] o [n×3] con n mayor o igual que
%   uno que representa un punto en el espacio para n frames.
% SALIDA
%   el una matriz cuyas filas o columnas (segun entrada) representan
%   versores. Estos versores son perpendiculares al plano que contiene a
%   los puntos cabeza1, cabeza2 y cola en cada frame. Estos versores estan 
%   orientados siguiedo la regla de la mano derecha, donde el vector uno es
%   el que definido con cabeza1 y cola, y el segundo vecoor esta definico 
%   con cabeza2 y cola.
% EJEMPLO
%   wPelvis=versor_con_dos_puntos(Marcador.r_asis,Marcador.l_asis,Marcador.sacrum)
% 
% Autor: Marcos Dominguez
% Noviembre 2020
function versor=versor_con_tres_puntos(cabeza1,cabeza2,cola)
vector=cross(cabeza1-cola,cabeza2-cola);
versor=convierteVectorAVersor(vector);
end