function EVENTOS_RECORTADOS=recalcular_eventos(EVENTOS_ORIGINALES,PrimerDatoConSenial)
Subnivel=fieldnames(EVENTOS_ORIGINALES);
for Cont=1:length(Subnivel)
    Sub=char(Subnivel{Cont});
    EVENTOS_RECORTADOS.(sprintf('%s',Sub))=EVENTOS_ORIGINALES.(sprintf('%s',Sub))-PrimerDatoConSenial+1;
end
end