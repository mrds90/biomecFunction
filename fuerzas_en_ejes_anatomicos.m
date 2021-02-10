%Autor: Marcos Dominguez
% Noviembre 2020
%La funcion recive como parametros una fuerza y dos ejes anatomicos (eje medial/lateral y rotacion int/ext).
%Calcula el tercer eje anatómico y descompone la fuerza en esos tres ejes.

function nuevo_vector=fuerzas_en_ejes_anatomicos(vector,eje_medial_lateral, eje_rotacion_int_ext,lado)
eje_antero_posterior=cross(eje_medial_lateral,eje_rotacion_int_ext);
eje_antero_posterior=convierteVectorAVersor(eje_antero_posterior);
nuevo_vector(:,2)=dot(vector,eje_antero_posterior,2);%
nuevo_vector(:,3)=dot(vector,eje_rotacion_int_ext,2);%
if strcmp(lado,'r')
    nuevo_vector(:,1)=dot(vector,eje_medial_lateral,2);%
elseif strcmp(lado,'l')
    nuevo_vector(:,1)=-dot(vector,eje_medial_lateral,2);%
end
end