%Noviembre 2020
%Autor: Marcos Dominguez

%Calculo los angulos de flexión/extención, abducción/aducción y rotación
%interna/externa de una articulación con los versores asociados al sistema
%coordenado local de los segmentos que se vinculan en la articulación en
%estudio.

%Variable lado: +1 si es derecha y -1 si es izquierda.
%Variable isAnlke: True si se va a estudiar el tobillo y False en caso
%contrario.
%Las variables ijk deben tener las mismas dimensiones entre si (frames×3 ó 3×frames).

function [alpha,beta,gamma]=angulos_articulares(iProximal,jProximal,kProximal,iDistal,kDistal,isAnkle,lado)

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
    if (isAnkle==true) % control si es la articulación del tobillo porque el angulo alpha difiere en el cálculo.
        disp('      calculando alfa')
        alpha=-asind(dot(IArticular,jProximal));%%rotación sobre eje articular 1 (coincide con k proximal)
    else
        disp('      calculando alfa')
        alpha=asind(dot(IArticular,iProximal)); %%rotación sobre eje articular 1 (coincide con k proximal)
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