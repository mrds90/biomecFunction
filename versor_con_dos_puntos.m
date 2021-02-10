% Calcula el versor con dirección coincidente al segmento de recta entre
% los puntos "cabeza" y "cola".
% El sentido del versor es desde "cola" a "cabeza".
function versor=versor_con_dos_puntos(cabeza,cola)
vector=cabeza-cola;
versor=convierteVectorAVersor(vector);
end