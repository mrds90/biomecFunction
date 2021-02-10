% Explora, utilizando recursividad, los elementos de una estructura y devuelve el valor mímimo entre todos los elementos

function MinimoAbsoluto=minimo_struct(ESTRUCTURA)
if isstruct(ESTRUCTURA)
        Subnivel=fieldnames(ESTRUCTURA);
        for Cont=1:size(Subnivel,1)
            Sub=char(Subnivel{Cont});
%             disp(sprintf('%s',Sub))
            Minimo(Cont)=minimo_struct(ESTRUCTURA.(sprintf('%s',Sub)));
        end
        MinimoAbsoluto=min(Minimo);
else
   MinimoAbsoluto=min(min(min(ESTRUCTURA)));
end
end
    