%Esta funcion decide cual sera el primer y ultimo elemento de la señal
%recortada. Debido a que los NaN pueden generar inconvenientes, en esta
%función se comprueba que la porción elegida para recortar la señal no
%tenga elementos NaN. 
% La función busca la conservar la máxima cantidad de señal posible, dentro
%de los limites establecidos en el argumento, sin elementos NaN. Es decir,
%que si dentro de los limites elegidos para el recorte todavía quedan
%elementos NaN, la funcion recortara mas de lo seteado a la señal para
%garantizar que no existan elementos NaN en la señal recortada.
% ENTRADA
%   MARCADORES: Estructura cuyos campos son las matrices de posicion de los
%   marcadores.
%   EVENTO: Estuctura cuyos campos son los eventos en frames del ciclo de
%   marcha.
%   framesAntesHSParaRecortar: cantidad de frames extras antes del primer
%   evento que se desea conservar para procesar los datos
%   framesDespuesHSParaRecortar: cantidad de frames extras despues del
%   ultimo evento que se desea conservar para procesar los datos.
% SALIDA
%   primerDatoConSenial: puede ser el indice del mayor primer elemento no 
%   NaN entre los marcadores o el indice cuyo valor es la resta de el
%   primer evento menos la variable "framesAntesHSParaRecortar". El 
%   algoritmo elige el mayor entre estas dos opciones.
%   ultimoDatoConSenial: puede ser el indice del menor ultimo elemento no 
%   NaN entre los marcadores o el indice cuyo valor es la suma del
%   ultimo evento mas la variable "framesDespuesHSParaRecortar". El 
%   algoritmo elige el mayor entre estas dos opciones.
% EJEMPLO
%   Caso donde se pretende dejar 10 frames antes del primer evento y 10 
%   frames despues del ultimo evento:
%      [primerDatoConSenial, ultimoDatoConSenial]=seleccionar_inicio_y_fin(MARCADORES,EVENTO,10,10)
% 
% Autor: Marcos Dominguez
% Noviembre 2020

function [primerDatoConSenial, ultimoDatoConSenial]=seleccionar_inicio_y_fin(MARCADORES,EVENTO,framesAntesHSParaRecortar,framesDespuesHSParaRecortar)
PrimerEvento=minimo_struct(EVENTO); %busco primer evento (minimo en la estructura de eventos)
UltimoEvento=maximo_struct(EVENTO); %busco ultimo evento (máximo en la estructura de eventos)
[primerDatoConSenial, ultimoDatoConSenial]=detectar_inicio_y_fin(MARCADORES); %busca los indices donde se garantiza que entre esos dos frames no hay ningun NaN entre todos los marcadoes 
if ((PrimerEvento-framesAntesHSParaRecortar)>primerDatoConSenial) %decide si usa el frame inicial seteado o no en funcion de si hay NaN, o no, en el intervalo de frames elegido en el argumento
    primerDatoConSenial=PrimerEvento-framesAntesHSParaRecortar;
end
if ((UltimoEvento+framesDespuesHSParaRecortar)<ultimoDatoConSenial) %decide si se usa el frame final seteado o no en funcion de si hay NaN, o no, en el intervalo de frames elegido en el argumento
    ultimoDatoConSenial=UltimoEvento+framesDespuesHSParaRecortar;
end
end