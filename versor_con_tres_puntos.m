% Calcula el versor con dirección perpendicular al plano formado por los
% tres puntos.
% Cola es el punto común a los dos versores calculados y el sentido respeta
% la regla de la mando derecha para el producto cruz entre el versor que
% tiene a cabeza1 por el que tiene cabeza2.
function versor=versor_con_tres_puntos(cabeza1,cabeza2,cola)
vector=cross(cabeza1-cola,cabeza2-cola);
versor=convierteVectorAVersor(vector);
end