% EVENTOS_RECORTADOS=recalcular_eventos(EVENTOS_ORIGINALES,PrimerDatoConSenial)
% La funcion recalcula a partir de una estructura de eventos en frames y el
% primer frame valido elegido los eventos nuevos para una señal recortada.
% ENTRADA
%   EVENTOS_ORIGINALES: estructura con campos correspondientes a cada
%   evento. Ejemplo de campos:
%       - RHS1
%       - LHS1
%       - RHS2
%       - LHS2
%       - RTO
%       - LTO
%  Los campos contienen un dato int de tamaño [1×1] con el valor en frame
%  del evento.
%   PrimerDatoConSenial: es el primer frame que consideramos util de
%   nuestra señal original para procesar los datos. Es una varaible de tipo
%   int y tamaño [1×1].
% SALIDA
%   EVENTO_RECORTADOS: es una estructura identica en formato a la variable
%   "EVENTOS_ORIGINALES" pero con los eventos redefinidos como si el frame
%   "PrimerDatoConSenial" fuera el frame 1.
% EJEMPLO
%   Caso en el que el primer frame que se va a utilizar son 10 frames antes
%   del contacto del pie derecho:
%       EVENTOS.RECORTADOS=recalcular_eventos(EVENTOS.ORIGINALES,RHS1-10)
% 
% Autor: Marcos Dominguez
% Noviembre 2020
function EVENTOS_RECORTADOS=recalcular_eventos(EVENTOS_ORIGINALES,PrimerDatoConSenial)
Subnivel=fieldnames(EVENTOS_ORIGINALES);
for Cont=1:length(Subnivel)
    Sub=char(Subnivel{Cont});
    EVENTOS_RECORTADOS.(sprintf('%s',Sub))=EVENTOS_ORIGINALES.(sprintf('%s',Sub))-PrimerDatoConSenial+1;
end
end