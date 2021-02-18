%Noviembre 2020
%Autor: Marcos Dominguez
%Funci�n que calcula los angulos de flexi�n/extenci�n, abducci�n/aducci�n y rotaci�n
%interna/externa de una articulaci�n en grados utilizando los versores asociados al sistema
%coordenado local de los segmentos que se vinculan a la articulaci�n en
%estudio.
% ENTRADAS
% - iProximal ,jProximal y kProximal: son matrices de tama�o 3�frames o
% frames�3 que corresponden a los vectores de los versores i,j y k del segmento
% proximal a la articulaci�n para todos los frames. Los elementos de la
% matriz son numericos y adimensionales.
% - iDistal,kDistal: son matrices de tama�o 3�frames o
% frames�3 que corresponden a los vectores de los versores i y k del segmento
% distal a la articulaci�n para todos los frames. Los elementos de la
% matriz son numericos y adimensionales.
% - lado: indica si se quiere evaluar una articulaci�n del lado derecho 
% o izquierdo. 1 si es derecha y -1 si es izquierda.
% - articulacion: variable de tipo char que define que articulaci�n se
% estudiara. Las opciones son 'cadera', 'rodilla' y 'tobillo'.
    
    
% SALIDAS
%   La variable "resultado" es la salida de la funci�n y corresponde al 
%   vector cuyos elementos son el angulo de euler deseado (alfa, beta o gama)
%   por cada frame.
%   El tama�o del vector de salida es frames�1 si las entradas son de
%   frames�3. En el caso de que las entradas sean 3�frames, la salida sera
%   de 1�frames.
%   Los elementos del vector es el angulo de Euler deseado en radianes.





function [alpha,beta,gamma]=angulos_articulares(iProximal,jProximal,kProximal,iDistal,kDistal,articulacion,lado)

    flag=0; % variable de control
    if (length(iProximal(:,1))>length(iProximal(1,:))) % cotrol de dimensiones de matriz (si los frames estan en las filas lo pasa a las columnas)
            iProximal=iProximal';
            jProximal=jProximal';
            kProximal=kProximal';
            iDistal=iDistal';
            kDistal=kDistal';
            flag=1; %variable de control para recordar que transpuse los datos originales
    end
disp('      calculando I articular')   
    IArticular=cross(kProximal,iDistal); % calculo de i de artiulaci�n
    if (strcmp(articulacion,'tobillo')) % control si es la articulaci�n del tobillo porque el angulo alpha difiere en el c�lculo.
        disp('      calculando alfa')
        alpha=-asind(dot(IArticular,jProximal));%%rotaci�n sobre eje articular 1 (coincide con k proximal)
    else
        disp('      calculando alfa')
        alpha=asind(dot(IArticular,iProximal)); %%rotaci�n sobre eje articular 1 (coincide con k proximal)
        if (strcmp(articulacion,'rodilla')) % control si es la articulaci�n de la rodilla porque se invierte el alfa
            alpha=-alpha;
        end
        
    end
    disp('      calculando gamma')
    gamma=-lado*asind(dot(IArticular,kDistal));%%rotaci�n sobre eje articular 3 (coincide con i distal)
    disp('      calculando beta')
    beta=lado*asind(dot(kProximal,iDistal));%%rotaci�n sobre eje articular 2 (coincide con I de articulaci�n)
    
    if flag==1 % si habia transpuesto vuelvo a transponer para conservar el formato de entrada.
    alpha=alpha';
    beta=beta';
    gamma=gamma';
    end
    
end