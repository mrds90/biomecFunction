% Explora, utilizando recursividad, los elementos de una estructura y devuelve el valor máximo entre
% todos los elementos.


function MaximoAbsoluto=maximo_struct(ESTRUCTURA)
if isstruct(ESTRUCTURA)
        Subnivel=fieldnames(ESTRUCTURA);
        for Cont=1:size(Subnivel,1)
            Sub=char(Subnivel{Cont});
%             disp(sprintf('%s',Sub))
            Maximo(Cont)=maximo_struct(ESTRUCTURA.(sprintf('%s',Sub)));
        end
        MaximoAbsoluto=max(Maximo);
else
   MaximoAbsoluto=max(max(max(ESTRUCTURA)));
end
end