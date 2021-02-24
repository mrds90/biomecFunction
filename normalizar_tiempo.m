% Normaliza temporalmente una matriz o vector. Define una nueva variable
% donde su dimensi�n mas larga es de 101 elementos y calcula los valores
% correspondientes mediante interpolaci�n.
% ENTRADA
%   Matriz: Es una matriz de tama�o [n�m] con elementos num�ricos. Esta es
%   la varaible que se normalizar�. Tipicamente ser� un vector de [n�1] o
%   [1�m] o una matriz de [n�3] o [3�m].
%   Evento 1: primer frame o indice de la dimensi�n mayor de la variable 
%   "Matriz" que corresponde al 0% de la variable normalizada. Es un dato
%   del tipo int con tama�o [1�1].
%   Evento 2: ultimo frame o indice de la dimensi�n mayor de la variable 
%   "Matriz" que corresponde al 100% de la variable normalizada. Es un dato
%   del tipo int con tama�o [1�1].
% SALIDA
%   vectorNormalizado: es una matriz de tama�o [n�101] o [101�m] (segun la 
%   entrada). Sus elementos corresponden a la interpolaci�n de los
%   elementos de la variable "Matriz" entre los indices "Evento1" y
%   "Evento2" de la dimensi�n de mayor longitud.

function vectorNormalizado= normalizar_tiempo(Matriz,Evento1,Evento2)
if (length(Matriz(:,1))>length(Matriz(1,:)))
    vectorNormalizado=zeros(101,length(Matriz(1,:)));
    for Cont=1:length(Matriz(1,:))
        Largo=Evento2-Evento1;
        XOriginal=0:Largo;
        XNuevo = 0 :Largo/100: Largo;
        vectorNormalizado(:,Cont)=interp1(XOriginal,Matriz(Evento1:Evento2,Cont),XNuevo);
    end
else
    vectorNormalizado=zeros(length(Matriz(:,1)),101);
    for Cont=1:length(Matriz(:,1))
        Largo=Evento2-Evento1;
        XOriginal=0:Largo;
        XNuevo = 0 :Largo/100: Largo;
        vectorNormalizado(Cont,:)=interp1(XOriginal,Matriz(Cont,Evento1:Evento2),XNuevo);
    end 
end
end