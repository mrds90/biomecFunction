function [Datos,fileName] = cargarRegistro()
% El llamado a esta funci�n permite cargar el archivo c3d.
% "Datos" donde est� toda la estructura del registro y 
%"Archivo" que es solamente el nombre del archivo que permite ver en el workspace el archivo sobre el que estoy trabajando
[DatosMarcadores, infoCinematica,Fuerzas,infoDinamica,Antropometria,Eventos,fileName]= leer_c3d();
Datos.Marcadores.Crudos=DatosMarcadores;% Se asignan los datos de los marcadores a esta parte de la estructura
Datos.Dinamica=Fuerzas; % Se asignan los datos de la plataforma1 a esta parte de la estructura
Datos.info.Cinematica=infoCinematica; % Se asignan los datos de la informaci�n cin�matica a esta parte de la estructura
Datos.info.Dinamica=infoDinamica; % Se asignan los datos de la informaci�n de plataforma de fuerzas a esta parte de la estructura
Datos.antropometria=Antropometria; %  Se asignan los datos de antropometr�a a esta parte de la estructura
Datos.eventos=Eventos; %  Se asignan los datos de los instantes de tiempo en que se producen los eventos del ciclo de marcha a esta parte de la estructura
end