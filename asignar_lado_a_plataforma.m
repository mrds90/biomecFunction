%Autor: Marcos Dominguez
%Noviembre 2020
% acepta los datos de las plataformas "DATOS.Dinamica.Plataforma1.Valores"
% y "DATOS.Dinamica.Plataforma1.Valores" junto a los enventos de inicio de
% ambos ciclos y devuelve las estructuras FUERZA y MOMENTO con el lado
% (izquiero o derecho) asignado segun corresponda.
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


