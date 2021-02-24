%Autor: Marcos Dominguez
%Noviembre 2020
% [inerciaPie, inerciaPierna , inerciaMuslo] = inercia_de_segmentos(pesoKg, alturaMts)
% Calcula las matrices de inercia del segmento pie,pierna y muslo en función de la masa y
% altura del sujeto (para sujetos adultos con todos los miembros).
% ENTRADA
%   pesoKg: en una variable de tipo double de tamaño [1×1] que representa el
%   peso en Kilogramos del sujeto en estudio.
%   alturaMts: en una variable de tipo double de tamaño [1×1] que representa 
%   la altura en metros del sujeto en estudio.
% SALIDA:
%   inerciaPie,inerciaPierna e inerciaMuslo: son las matrices de inercia del
%   pie, pierna y muslo respectivamente. Estas matrices tienen tamaño [3×3]
%   debido a que se consideran constate para todos los frames. Estan
%   expresadas en terminos del sistema coordenado local y sus unidades son
%   [Kg×m^2]
function [inerciaPie, inerciaPierna , inerciaMuslo] = inercia_de_segmentos(pesoKg, alturaMts)
alturaMts=alturaMts*100;
CoefIyy=[-100 0.480 0.626;-1105 4.59 6.63 ;-3557 31.7 18.61];
CoefIzz=[-97.09 0.414 0.614 ;-1152 4.594 6.815 ;-3690 32.02 19.24];
CoefIxx=[-15.48 0.144 0.088;-70.5 1.134 0.3 ;-13.5 11.3 -2.28];

Ixx=CoefIxx(:,1)+pesoKg*CoefIxx(:,2)+alturaMts*CoefIxx(:,3);
Iyy=CoefIyy(:,1)+pesoKg*CoefIyy(:,2)+alturaMts*CoefIyy(:,3);
Izz=CoefIzz(:,1)+pesoKg*CoefIzz(:,2)+alturaMts*CoefIzz(:,3);
I=[Ixx/(100^2),Iyy/(100^2),Izz/(100^2)]; %paso a kg×m^2


inerciaPie=diag(I(1,:));
inerciaPierna=diag(I(2,:));
inerciaMuslo=diag(I(3,:));

end