%Autor: Marcos Dominguez
% Noviembre 2020
% La funcion recive como parametros un Momento en coordenadas globales y
% dos ejes anatomicos (eje flexi�n/extensi�n y rotacion int/ext). Calcula el 
% tercer eje anat�mico y descompone el vector de Momento en esos tres ejes.
% Util para expresar el Momento global en termino de los ejes anat�micos.
% ENTRADA
%     vector: es una matriz de tama�o [n�3] con n mayor o igual a 1. Cada 
%     fila de la matriz, compuesta de tres elementos, representa un Momento
%     expresado en terminos del sistema coordenado global para un frame
%     determinado. 
%     eje_medial_lateral: matriz de tama�o [n�3] con n mayor o igual a 1. 
%     Cada fila de la matriz, compuesta de tres elementos, representa un 
%     versor cuya orientaci�n se corresponde al eje de flexi�n/extensi�n
%     de la articulaci�n que se esta evaluando.
%     eje_rotacion_int_ext: matriz de tama�o [n�3] con n mayor o igual a 1. 
%     Cada fila de la matriz, compuesta de tres elementos, representa un 
%     versor cuya orientaci�n se corresponde al eje de rotacion int/ext de 
%     la articulaci�n que se esta evaluando.
%     lado: lado es una variable char de tama�o [1�1] que puede tomar el
%     valor 'r' para el analisis de articulaciones del miembro derecho o
%     'l' para analisis de articulaciones del miembro izquiedo.
% SALIDA
%      nuevo_vector: matriz de tama�o [n�3] cuyas columnas representan la
%      proyecci�n del momento de entrada (variable "vector") en los ejes 
%      anatomicos para cada frame. En la columna 1 esta la proyecci�n sobre el
%      eje de flexi�n/extensi�n, en la columna dos esta la proyecci�n sobre el
%      eje abducci�n/aducci�n y en la columna tres esta la proyecci�n del 
%      vector momento sobre el eje de rotaci�n int/ext.
function nuevo_vector=momentos_en_ejes_anatomicos(vector,eje_medial_lateral, eje_rotacion_int_ext,lado)
eje_antero_posterior=cross(eje_medial_lateral,eje_rotacion_int_ext);
eje_antero_posterior=convierteVectorAVersor(eje_antero_posterior);

nuevo_vector(:,1)=dot(vector,eje_medial_lateral,2);%
if strcmp(lado,'r')
    nuevo_vector(:,2)=dot(vector,eje_antero_posterior,2);%
    nuevo_vector(:,3)=dot(vector,eje_rotacion_int_ext,2);%
elseif strcmp(lado,'l')
    nuevo_vector(:,2)=-dot(vector,eje_antero_posterior,2);%
    nuevo_vector(:,3)=-dot(vector,eje_rotacion_int_ext,2);%
end
end