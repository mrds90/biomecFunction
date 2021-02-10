% Autor: Marcos Dominguez
% Noviembre 2020
% recorre los campos de una estructura (que sean vectores) y devuelve una matriz compuesta por los vectores
function [ESTRUCTURA2]=vectores_de_estructura_a_matriz(ESTRUCTURA)

Subnivel=fieldnames(ESTRUCTURA);
for cont=1:size(Subnivel,1)% de 1 a la cantidad de elemntos que tiene la estructura
    sub=char(Subnivel{cont}); % Rescato nombre del campo correspondiete al ciclo del for.
    ESTRUCTURA2(:,cont)=ESTRUCTURA.(sprintf('%s',sub));

end
