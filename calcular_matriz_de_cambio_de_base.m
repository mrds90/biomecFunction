%autor: Marcos Dominguez
%Noviembre 2020
function matriz=calcular_matriz_de_cambio_de_base(eje,angulo)% angulo en Rad
    switch eje
        case 'x'
            
            matriz(2,2,:)=cos(angulo);
            matriz(2,3,:)=sin(angulo);
            matriz(3,2,:)=-sin(angulo);
            matriz(3,3,:)=cos(angulo);    
            matriz(1,1,:)=1;
        case 'y'
            matriz(1,1,:)=cos(angulo);
            matriz(1,3,:)=-sin(angulo);
            matriz(2,2,:)=1;
            matriz(3,1,:)=sin(angulo);
            matriz(3,3,:)=cos(angulo);
        case 'z'
            matriz(1,1,:)=cos(angulo);
            matriz(1,2,:)=sin(angulo);
            matriz(2,1,:)=-sin(angulo);
            matriz(2,2,:)=cos(angulo);
            matriz(3,3,:)=1;        
    end
end