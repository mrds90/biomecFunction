%abril 2019
%Autor: Marcos Dominguez.

% Aplica derivada a los campos finales de una estructura respecto a su
% maxima dimensión (tipicamente dimensión que representa a los frames). 
% Devuelve una estructura identica (estructuralmene) pero con los valores derivadoes.

function estructura=derivar_estructutra(estructura,dt)

if isstruct(estructura)
        Subnivel=fieldnames(estructura);
        for Cont=1:size(Subnivel,1)
            Sub=char(Subnivel{Cont});
            estructura.(sprintf('%s',Sub))=derivar_estructutra(estructura.(sprintf('%s',Sub)),dt);
            disp(sprintf('        se derivo campo %s',Sub))
            
        end
    else
        estructura=derivada_vectores(estructura,dt);
end
end