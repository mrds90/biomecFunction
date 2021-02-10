%busca los indices donde se garantiza que entre esos dos frames no hay ningun NaN entre todos los
%marcadoes 
function [PrimerDato , UltimoDato]=detectar_inicio_y_fin(MARCADORES)
Subnivel=fieldnames(MARCADORES);% obtengo los nombres de los marcadores
Tamano=length(Subnivel); %cuento la cantidad de elementos
for Cont=1:Tamano-2 % recorro hasta Tamano-2 porque los ultimos dos son los centros de presión y no quiero que influyan su mayor cantidad de NaN.
    Sub=char(Subnivel{Cont}); %extraigo el nombre de el marcador que corresponda para el ciclo del for.
    [Primero(Cont), ~]=find(~isnan(MARCADORES.(sprintf('%s',Sub))),1,'first'); %guardo en vector el indice del primer elenmento no NaN de este marcador.
    [Ultimo(Cont), ~]=find(~isnan(MARCADORES.(sprintf('%s',Sub))),1,'last'); %guardo en vector el indice del último elenmento no NaN de este marcador.
end
PrimerDato=max(Primero); %el mayor del vetor Primero garantiza que antes no hay NaN entre todos los marcadores.
UltimoDato=min(Ultimo); %el menor del vetor Ultimo garantiza que despues no hay NaN entre todos los marcadores.
end