%cambia de base a un vector en función de la matriz de cambio de base.
%permite operar para todos los frames
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