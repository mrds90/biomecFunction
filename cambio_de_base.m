%Autor: Marcos Dominguez
%Noviembre 2020
%Funcion que permite realizar el cambio de base de un vector con la matriz
%de cambio de base. Permite operar para todos los frames.
%ENTRADA
% matrizCambioDeBase: corresponde a las matrices de cambio de base que se 
% desea premultiplicar en cada cuadro. Su tama�o es [3�3�n], donde n es un
% entero mayor o igual a 1 (uno).
% vector: es el vector que se desea expresar en terminos de otro sistema
% coordenado (o rotar). El tama�o de este vector es de [3�n].
%SALIDA
% vectorNuevo es un vector con tama�o id�ntico a "vector" pero representa
% el vector expresado en terminos de la nueva base.
function vectorNuevo=cambio_de_base(matrizCambioDeBase,vector)
    if size(vector,1)>3
        vector=vector';
        flag=1;
    else
        flag=0;
    end
    
    vector=cat(3, vector,vector,vector);
    vector=permute(vector,[3 1 2]);
    vectorNuevo=sum(matrizCambioDeBase.*vector,2);
    vectorNuevo=permute(vectorNuevo,[1 3 2]);

    if flag==1
        vectorNuevo=vectorNuevo';
    end
end