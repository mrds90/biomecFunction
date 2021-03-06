% Recibe como par�metro la estuctura de "eventos" y la frecuencia de
% muestreo. 
% La estructura de eventos en el c3d muestra los tiempos en los que suceden
% los dos contactos (HS1 y HS2) y el despege del pie (TO) para ambos
% mienbros (R y L). Como tenemos la necesidad de conocer el valor en frames
% de esos eventos, multiplicamos el tiempo de cada evento por la frecuencia
% de muestreo y obtenemos el frame en el que sucedi� el evento.
% HS1 y HS2 son la referencia de inicio y fin del ciclo de marcha. Y TO es
% el evento que separa la fase de apoyo y vuelo.
% Doc_MAF (referencia sobre quien documenta la funcion, a fines de la revision solamente)
% DESCRIPCION
    %La funci�n eventos_a_frames recibe la estructura de EVENTOS  y la frecuenciaDeMuestreo 
    %para convertir los datos de HS1,HS2 y TO que se encuentran en tiempo (segundos) a numero
    %de Frames, utilizando la Frecuencia de adquisici�n de los datos. 
% ENTRADAS
    %EVENTOS Estructura que tiene los campos:
%     Derecho_RHS: Contactos del pie derecho (type:struct, tama�o [1x2], 
%       unidades: segundos)
%     Izquierdo_LHS: Contactos del pie izquierdo (type:struct, tama�o [1x2], 
%       unidades: segundos)
%     Derecho_RTO: Despegue del pie derecho (type:struct, tama�o [1x1], 
%       unidades: segundos)
%     Izquierdo_LTO: Despegue del pie izquierdo (type:struct, tama�o [1x1], 
%       unidades: segundos)
    %frecuenciaDeMuestreo (type: double, tama�o 1x1, unidades:fps-frames por segundo-)
% SALIDAS
    % frameRHS1,frameLHS1,frameRHS2,frameLHS2,frameRTO,frameLTO (type: int, tama�o: 1x1, unidades: frames)
    % Frames -o cuadros- son los �ndices correspondientes al n�mero de dato registrado 
    % que representa cada uno de los 6 enventos identificados en el registro:
    % HS1: PRIMER HEEL STRIKE (PRIMER CONTACTO DE TALON), 
    % HS2: SEGUNDO HEEL STRIKE (SEGUNDO CONTACTO DE TALON), 
    % TO: (TOE OFF DESPEGUE DE LA PUNTA DEL PIE), 
    % para ambos miembros inferiores R (RIGHT - DERECHO) Y L (LEFT - IZQUIERDO)

function [frameRHS1,frameLHS1,frameRHS2,frameLHS2,frameRTO,frameLTO] = eventos_a_frames(EVENTOS,frecuenciaDeMuestreo)
frameRHS1=round(EVENTOS.Derecho_RHS(1)*frecuenciaDeMuestreo);
frameLHS1=round(EVENTOS.Izquierdo_LHS(1)*frecuenciaDeMuestreo);
frameRHS2=round(EVENTOS.Derecho_RHS(2)*frecuenciaDeMuestreo);
frameLHS2=round(EVENTOS.Izquierdo_LHS(2)*frecuenciaDeMuestreo);
frameRTO=round(EVENTOS.Derecho_RTO*frecuenciaDeMuestreo);
frameLTO=round(EVENTOS.Izquierdo_LTO*frecuenciaDeMuestreo);

end