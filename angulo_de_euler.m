% resultado=angulo_de_euler(iLocal,jLocal,kLocal,angulo)
% 
% Funcion que a partir de los versores i,j,k local de un segmento devuelve
% el angulo de euler deseado (alfa, beta o gama) en radianes.
% No tiene aplicado algoritmo de correción de salto +pi -pi. Se sugiere 
% utilizar funcion "corr_ang180" para corregir los problemas de
% salto
% ENTRADAS
%   La funcion recibe las matrices iLocal, jLocal y kLocal. Estas pueden
%   ser matrices de tamaño frames×3 o 3×frames siempre que sean las 3 del mismo
%   tamaño. El tipo de dato de los elementos de la matriz es numerico (ejemplo: int o double)
%   El argumento "angulo" es del tipo 1x4 char y según el angulo deseado es: 
%       - 'alfa'
%       - 'beta'
%       - 'gama'
% SALIDAS
%   La variable "resultado" es la salida de la función y corresponde al 
%   vector cuyos elementos son el angulo de euler deseado (alfa, beta o gama)
%   por cada frame.
%   El tamaño del vector de salida es frames×1 si las entradas son de
%   frames×3. En el caso de que las entradas sean 3×frames, la salida sera
%   de 1×frames.
%   Los elementos del vector son el angulo de Euler deseado en radianes.
% EJEMPLO
% alfaDeMusloDerecho=angulo_de_euler(iMusloDerecho,jMusloDerecho,kMusloDerecho,'alfa')
% 
% Autor: Marcos Dominguez
% Noviembre 2020.



function resultado=angulo_de_euler(iLocal,jLocal,kLocal,angulo)



    if length(iLocal(1,:))>length(iLocal(:,1))
        FilasOColumnas=1;
    else
        FilasOColumnas=2;
    end
    if FilasOColumnas==1
        frames=length(iLocal(1,:));
        I=[ones(1,frames) ; zeros(2,frames)];
        J=[zeros(1,frames) ; ones(1,frames) ; zeros(1,frames)];
        K=[zeros(2,frames) ; ones(1,frames)];
    else 
        frames=length(iLocal(:,1));
        I=[ones(frames,1) , zeros(frames,2)];
        J=[zeros(frames,1) , ones(frames,1) , zeros(frames,1)];
        K=[zeros(frames,2) , ones(frames,1)];
    end
    
    lineaDeNodos=cross(K,kLocal);
    lineaDeNodos=convierteVectorAVersor(lineaDeNodos);
    switch angulo
        case 'alfa'
            resultado=acos(dot(I,lineaDeNodos,FilasOColumnas)).*(dot(lineaDeNodos,J,FilasOColumnas)./abs(dot(lineaDeNodos,J,FilasOColumnas)));
        case 'beta'
            lineaDeNodos2=cross(lineaDeNodos,K);
            lineaDeNodos2=convierteVectorAVersor(lineaDeNodos2);
            resultado=acos(dot(K,kLocal,FilasOColumnas)).*(dot(lineaDeNodos2,kLocal,FilasOColumnas)./abs(dot(lineaDeNodos2,kLocal,FilasOColumnas)));
        case 'gama'
            resultado=acos(dot(lineaDeNodos,iLocal,FilasOColumnas)).*(-dot(lineaDeNodos,jLocal,FilasOColumnas)./abs(dot(lineaDeNodos,jLocal,FilasOColumnas)));
    end  
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            