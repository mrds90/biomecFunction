% Autor: Marcos Dominguez
% Noviembre 2020.

% funcion que a partir de los versores i,j,k local de un segmento devuelve
% el angulo de euler deseado (alfa, beta o gama) en radianes.
% No tiene aplicado algoritmo de correción de salto +pi -pi.
% se sugiere utilizar funcion "corr_ang180" para corregir los problemas de
% salto


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
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            