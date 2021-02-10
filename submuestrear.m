function SenialSubmuestreada=submuestrear(Senial,Salto)
if isstruct(Senial)
        Subnivel=fieldnames(Senial);
        for Cont=1:size(Subnivel,1)
            Sub=char(Subnivel{Cont});
            SenialSubmuestreada.(sprintf('%s',Sub))=submuestrear(Senial.(sprintf('%s',Sub)),Salto);
            disp((sprintf('    submuestreando %s',Sub)));
            
        end
else
    SenialSubmuestreada=Senial(1:Salto:length(Senial),:);
end
