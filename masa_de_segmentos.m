%Autor: Marcos Dominguez
%Noviembre 2020

%Calcula la masa del segmento pie,pierna y muslo en función de la masa y
%altura del sujeto (para sujetos adultos con todos los miembros).

function [masaPie, masaPierna , masaMuslo] = masa_de_segmentos(pesoKg, alturaMts)
alturaMts=alturaMts*100;
coefMasa=[-0.8290    0.0077    0.0073;   -1.5920    0.0362    0.0121;   -2.6490    0.1463    0.0137];
masa=coefMasa(:,1)+pesoKg*coefMasa(:,2)+alturaMts*coefMasa(:,3);
masaPie=masa(1);
masaPierna=masa(2);
masaMuslo=masa(3);
 
end