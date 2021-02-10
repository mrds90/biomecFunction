function [frameRHS1,frameLHS1,frameRHS2,frameLHS2,frameRTO,frameLTO] = eventos_a_frames(EVENTOS,frecuenciaDeMuestreo)
% Recibe como parámetro la estuctura de "eventos" y la frecuencia de
% muestreo. 
% La estructura de eventos en el c3d muestra los tiempos en los que suceden
% los dos contactos (HS1 y HS2) y el despege del pie (TO) para ambos
% mienbros (R y L). Como tenemos la necesidad de conocer el valor en frames
% de esos eventos, multiplicamos el tiempo de cada evento por la frecuencia
% de muestreo y obtenemos el frame en el que sucedió el evento.
% HS1 y HS2 son la referencia de inicio y fin del ciclo de marcha. Y TO es
% el evento que separa la fase de apoyo y vuelo.

frameRHS1=round(EVENTOS.Derecho_RHS(1)*frecuenciaDeMuestreo);
frameLHS1=round(EVENTOS.Izquierdo_LHS(1)*frecuenciaDeMuestreo);
frameRHS2=round(EVENTOS.Derecho_RHS(2)*frecuenciaDeMuestreo);
frameLHS2=round(EVENTOS.Izquierdo_LHS(2)*frecuenciaDeMuestreo);
frameRTO=round(EVENTOS.Derecho_RTO*frecuenciaDeMuestreo);
frameLTO=round(EVENTOS.Izquierdo_LTO*frecuenciaDeMuestreo);

end