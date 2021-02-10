% Autor: Marcos Dominguez
% Noviembre 2020
%Esta funcion decide cual sera el primer y ultimo elemento de la se�al
%recortada. Debido a que los NaN pueden generar inconvenientes, en esta
%funci�n se comprueba que la porci�n elegida para recortar la se�al no
%tenga elementos NaN. 
% La funci�n busca la conservar la m�xima cantidad de se�al posible, dentro
%de los limites establecidos en el argumento, sin elementos NaN. Es decir,
%que si dentro de los limites elegidos para el recorte todav�a quedan
%elementos NaN, la funcion recortara mas de lo seteado a la se�al para
%garantizar que no existan elementos NaN en la se�al recortada.

function [primerDatoConSenial, ultimoDatoConSenial]=seleccionar_inicio_y_fin(MARCADORES,EVENTO,framesAntesHSParaRecortar,framesDespuesHSParaRecortar)
PrimerEvento=minimo_struct(EVENTO); %busco primer evento (minimo en la estructura de eventos)
UltimoEvento=maximo_struct(EVENTO); %busco ultimo evento (m�ximo en la estructura de eventos)
[primerDatoConSenial, ultimoDatoConSenial]=detectar_inicio_y_fin(MARCADORES); %busca los indices donde se garantiza que entre esos dos frames no hay ningun NaN entre todos los marcadoes 
if ((PrimerEvento-framesAntesHSParaRecortar)>primerDatoConSenial) %decide si usa el frame inicial seteado o no en funcion de si hay NaN, o no, en el intervalo de frames elegido en el argumento
    primerDatoConSenial=PrimerEvento-framesAntesHSParaRecortar;
end
if ((UltimoEvento+framesDespuesHSParaRecortar)<ultimoDatoConSenial) %decide si se usa el frame final seteado o no en funcion de si hay NaN, o no, en el intervalo de frames elegido en el argumento
    ultimoDatoConSenial=UltimoEvento+framesDespuesHSParaRecortar;
end
end