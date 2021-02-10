% Funcion que reccorre una estructura y ejecuta la función sobre los
% elementos al final de la cadena de la estructura
function A=filtrar_estructutra(estructura,a,b)
    if isstruct(estructura)
            Subnivel=fieldnames(estructura);
            for Cont=1:size(Subnivel,1)
                Sub=char(Subnivel{Cont});
                disp(sprintf('      - %s:',Sub))
                A.(sprintf('%s',Sub))=filtrar_estructutra(estructura.(sprintf('%s',Sub)),a,b);
            end
        else
            if ~isnan(sum(sum(estructura)))
            A=filtfilt(a,b,estructura);
            disp('         filtrada')
            else
            A=estructura;
            disp('         NO filtrada')
            end
            A(isnan(A))=0;
    end
end