% [FUERZA, MOMENTO]=asignar_lado_a_plataforma(plataforma1,plataforma2,RHS1,LHS1)
% Es una función de acondicionamiento de datos que permite referenciar los 
% datos dinamicos de las plataforma 1 y 2 a los miembros derecho e 
% izquierdo evaluando el orden de los eventos iniciales de cada miembro y
% el orden en el que se activan las plataformas.
% Esta función genera una nueva estructura donde las Fuerzas y Momentos de
% la plataforma se organizan en funcion de derecha e izquierda.
% ENTRADAS
%   plataforma1 y plataforma2:
%     son los valores de las plataformas que se encuentras en el formato 
%     del c3d (como en "DATOS.Dinamica.Plataforma1.Valores" y 
%     "DATOS.Dinamica.Plataforma2.Valores"). Ambas variables son del tipo 
%     struct con 6 campos: 
%       - Fx1 o Fx2
%       - Fy1 o Fy2
%       - Fz1 o Fz2
%       - Mx1 o Mx2
%       - My1 o My2
%       - Mz1 o Mz2
%     Cualquiera de los campos anteriores son vectores de n×1 y representan
%     las fuerzas (F) o momentos (M) para las componentes "x","y" o "z" de
%     las plataformas 1 o 2. La longitud n de los vectores puede ser de
%     longitud igual a la cantidad de frames o tres veces la cantidad de
%     frames si las señales no fueron submuestreadas.
%   RHS1 y LHS1:
%     Son los eventos de HeelStrike derecho (RHS1) e izquierdo (LHS1) iniciales de cada
%     ciclo. Estos pueden estar en frame o en segundos (formato int o
%     double). El tamaño de estas dos variables es de 1×1.
% SALIDA
%   FUERZA: struct con los campos:
%       - plataforma_r: matriz de n×3, donde cada columna
%       representa la componente X,Y y Z de la fuerza de reacción de la
%       platafoma donde pisa el pie derecho para rodos los frames.
%       - plataforma_l: matriz de n×3, donde cada columna
%       representa la componente X,Y y Z de la fuerza de reacción de la
%       platafoma donde pisa el pie izquierdo para rodos los frames.
%   MOMENTO: struct con los campos:
%       - plataforma_r: matriz de n×3, donde cada columna
%       representa la componente X,Y y Z del momento de la
%       platafoma donde pisa el pie derecho para rodos los frames.
%       - plataforma_l: matriz de n×3, donde cada columna
%       representa la componente X,Y y Z del momento de la
%       platafoma donde pisa el pie izquierdo para rodos los frames.
% EJEMPLO
%   [FUERZA, MOMENTO]=asignar_lado_a_plataforma(DATOS.Dinamica.Plataforma1.Valores,DATOS.Dinamica.Plataforma2.Valores,EVENTO.RHS1,EVENTO.LHS1)
% 
%Autor: Marcos Dominguez
%Noviembre 2020
function [FUERZA, MOMENTO]=asignar_lado_a_plataforma(plataforma1,plataforma2,RHS1,LHS1)
plataforma1=vectores_de_estructura_a_matriz(plataforma1);
plataforma2=vectores_de_estructura_a_matriz(plataforma2);
[indice1]=(find(plataforma1,1));
[indice2]=(find(plataforma2,1));

if indice1<indice2
    if RHS1<LHS1
        FUERZA.plataforma_r=plataforma1(:,1:3);
        MOMENTO.plataforma_r=plataforma1(:,4:6);
        FUERZA.plataforma_l=plataforma2(:,1:3);
        MOMENTO.plataforma_l=plataforma2(:,4:6);
    else
        FUERZA.plataforma_l=plataforma1(:,1:3);
        MOMENTO.plataforma_l=plataforma1(:,4:6);
        FUERZA.plataforma_r=plataforma2(:,1:3);
        MOMENTO.plataforma_r=plataforma2(:,4:6);
    end
else
    if RHS1<LHS1
        FUERZA.plataforma_l=plataforma1(:,1:3);
        MOMENTO.plataforma_l=plataforma1(:,4:6);
        FUERZA.plataforma_r=plataforma2(:,1:3);
        MOMENTO.plataforma_r=plataforma2(:,4:6);
    else
        FUERZA.plataforma_r=plataforma1(:,1:3);
        MOMENTO.plataforma_r=plataforma1(:,4:6);
        FUERZA.plataforma_l=plataforma2(:,1:3);
        MOMENTO.plataforma_l=plataforma2(:,4:6);
    end
end


