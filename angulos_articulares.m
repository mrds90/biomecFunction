%Noviembre 2020
%Autor: Marcos Dominguez
%Función que calcula los angulos de flexión/extención, abducción/aducción y rotación
%interna/externa de una articulación en grados utilizando los versores asociados al sistema
%coordenado local de los segmentos que se vinculan a la articulación en
%estudio.
% ENTRADAS
% - iProximal ,jProximal y kProximal: son matrices de tamaño 3×frames o
% frames×3 que corresponden a los versores i,j y k del segmento
% proximal a la articulación para todos los frames. Los elementos de la
% matriz son numericos y adimensionales.
% - iDistal,kDistal: son matrices de tamaño 3×frames o
% frames×3 que corresponden a los versores i y k del segmento
% distal a la articulación para todos los frames. Los elementos de la
% matriz son numericos y adimensionales.
% - lado: indica si se quiere evaluar una articulación del lado derecho 
% o izquierdo. 1 si es derecha y -1 si es izquierda.
% - articulacion: variable de tipo char que define que articulación se
% estudiara. Las opciones son 'cadera', 'rodilla' y 'tobillo'.
% SALIDAS
% alpha: vector cuyos elementos son el angulo alfa de la articulacion
% deseada por cada frame. Los elementos del vector estan en grados. El
% tamaño del vector es de 1×frames si las matrices de entrada son de
% 3×frames. En el caso de que las de que las matrices de entrada sean de
% frames×3 alpha será de frames×1.
% beta: vector cuyos elementos son el angulo beta de la articulacion
% deseada por cada frame. Los elementos del vector estan en grados. El
% tamaño del vector es de 1×frames si las matrices de entrada son de
% 3×frames. En el caso de que las de que las matrices de entrada sean de
% frames×3 beta será de frames×1.
% gamma: vector cuyos elementos son el angulo gama de la articulacion
% deseada por cada frame. Los elementos del vector estan en grados. El
% tamaño del vector es de 1×frames si las matrices de entrada son de
% 3×frames. En el caso de que las de que las matrices de entrada sean de
% frames×3 gamma será de frames×1.




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
    IArticular=cross(kProximal,iDistal); % calculo de i de artiulación
    if (strcmp(articulacion,'tobillo')) % control si es la articulación del tobillo porque el angulo alpha difiere en el cálculo.
        disp('      calculando alfa')
        alpha=-asind(dot(IArticular,jProximal));%%rotación sobre eje articular 1 (coincide con k proximal)
    else
        disp('      calculando alfa')
        alpha=asind(dot(IArticular,iProximal)); %%rotación sobre eje articular 1 (coincide con k proximal)
        if (strcmp(articulacion,'rodilla')) % control si es la articulación de la rodilla porque se invierte el alfa
            alpha=-alpha;
        end
        
    end
    disp('      calculando gamma')
    gamma=-lado*asind(dot(IArticular,kDistal));%%rotación sobre eje articular 3 (coincide con i distal)
    disp('      calculando beta')
    beta=lado*asind(dot(kProximal,iDistal));%%rotación sobre eje articular 2 (coincide con I de articulación)
    
    if flag==1 % si habia transpuesto vuelvo a transponer para conservar el formato de entrada.
    alpha=alpha';
    beta=beta';
    gamma=gamma';
    end
    
end