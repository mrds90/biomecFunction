% matriz=calcular_matriz_de_cambio_de_base(eje,angulo)
% La funcion calcula las matrices de cambio de base respecto a un eje
% elegido. El valor de estas matrices dependen de los angulos que se
% utilizan para definirlas.
% ENTRADA
%   eje: es una variable de tipo char cuyas opciones son 'x','y' o 'z' y
%   define sobre que eje se raliza el cambio de base.
%   angulo: es un vector cuyos elementos son los valores angulares, en
%   radianes, que se desean utilizar para realizar el cambio de base.
%   Tipicamente la longitud de este vector sera igual a la cantidad de
%   frames utilizados en el proyecto.
% SALIDA
%  matriz: es un vector de martices de tamaño [3×3×n], donde n es igual a
%  la longitud de la variable de entrada 'angulo'. Cada matriz de [3×3]
%  corresponde a la matriz de cambio de base en el eje elegido (x,y o z)
%  con el angulo correspondiente al indice del vector 'angulo'.
% EJEMPLO
%  definicion de matriz de cambio de base para el sistema intermedio
%  "prima" a el sistema coordenado local el muslo derecho.
%  matrizDeSistemaPrimaALocalDeMusloDerecho=calcular_matriz_de_cambio_de_base('z',gammaMusloDerecho)
%  la varaible "gammaMusloDerecho" es un vector de n elementos donde cada
%  elemento es el angulo gama en radianes del muslo derecho.
% 
% Autor: Marcos Dominguez
% Noviembre 2020

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