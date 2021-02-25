% Autor: Marcos Dominguez
% Noviembre 2020
% La funcion recalcula a partir de una estructura de eventos en frames y el
% primer frame valido elegido los eventos nuevos para una se�al recortada.
% ENTRADA
%   EVENTOS_ORIGINALES: estructura con campos correspondientes a cada
%   evento. Ejemplo de campos:
%       - RHS1
%       - LHS1
%       - RHS2
%       - LHS2
%       - RTO
%       - LTO
%  Los campos contienen un dato int de tama�o [1�1] con el valor en frame
%  del evento.
% SALIDA
%   EVENTO_RECORTADOS: es una estructura identica en formato a la variable
%   "EVENTOS_ORIGINALES" pero con los eventos redefinidos como si el frame
%   "PrimerDatoConSenial" fuera el frame 1.
function EVENTOS_RECORTADOS=recalcular_eventos(EVENTOS_ORIGINALES,PrimerDatoConSenial)
Subnivel=fieldnames(EVENTOS_ORIGINALES);
for Cont=1:length(Subnivel)
    Sub=char(Subnivel{Cont});
    EVENTOS_RECORTADOS.(sprintf('%s',Sub))=EVENTOS_ORIGINALES.(sprintf('%s',Sub))-PrimerDatoConSenial+1;
end
end