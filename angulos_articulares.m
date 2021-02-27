% [alpha,beta,gamma]=angulos_articulares(iProximal,jProximal,kProximal,iDistal,kDistal,articulacion,lado)
% Función que calcula los angulos de flexión/extención, abducción/aducción 
% y rotación interna/externa de una articulación en grados utilizando los 
% versores asociados al sistema coordenado local de los segmentos que se 
% vinculan a la articulación en estudio.
% ENTRADAS
%   iProximal ,jProximal y kProximal: son matrices de tamaño 3×nro-de-frames o
%   nro-de-frames×3 que corresponden a los versores i,j y k del segmento
%   proximal a la articulación. Los elementos de la
%   matriz son numericos y adimensionales.
%   iDistal,kDistal: son matrices de tamaño 3×nro-de-frames o
%   nro-de-frames×3 que corresponden a los versores i y k del segmento
%   distal a la articulación para todos los frames. Los elementos de la
%   matriz son numericos y adimensionales.
%   articulacion: variable de tipo char que define que articulación se
%   estudiara. Las opciones son 'cadera', 'rodilla' y 'tobillo'.
%   lado: indica si se quiere evaluar una articulación del lado derecho 
%   o izquierdo. 1 si es derecha y -1 si es izquierda.
% SALIDAS
%   alpha, beta y gamma: vectores cuyos elementos son el angulo alfa, beta 
%   y gamma respectivamente de la articulacion deseada por cada frame. Los 
%   elementos de cada vector estan en grados. El tamaño de cada vector es 
%   de 1×nro-de-frames si las matrices de entrada son de 3×nro-de-frames. 
%   En el caso de que las matrices de entrada sean de nro-de-frames×3 
%   alpha, cada vector tendrá un tamaño de de nro-de-frames×1.
% 
% EJEMPLO para llamar a la función, para calcular los ángulos de rodilla 
% derecha:
%   [alpharodd,betarodd,gammarodd]=angulos_articulares(imuslo,jmuslo,kmuslo,ipierna,kpierna,'rodilla',1);
% 
% Autor: Marcos Dominguez
% Noviembre 2020




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