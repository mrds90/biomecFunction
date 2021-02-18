%Autor: Marcos Dominguez
%Noviembre 2020
% La funcion calcula las matrices de cambio de base local a global (MLaG) y  global
% a local (MGaL) a partir de los versores i,j y k del segmento.
% ENTRADA
% Las variables de entrada i, j y k son matrices de tamaño [frames×3] cuyos
% elementos son adimensionales.
% SALIDA
% MLaG: es un vector de matrices de tamaño [3×3×frames] donde cada matriz
% de [3×3] corresponde a la matriz de cambio de base de local a global del 
% segmento en estudio para un frame determinado.
% MGaL: es un vector de matrices de tamaño [3×3×frames] donde cada matriz
% de [3×3] corresponde a la matriz de cambio de base de global a local del 
% segmento en estudio para un frame determinado.

function [MLaG , MGaL]=calcular_matrices_g_a_l(i,j,k)
    MLaG=cat(3,i,j,k);
    MLaG=permute(MLaG,[2 3 1]);
    MGaL=permute(MLaG,[2 1 3]);
end