%Normaliza un vector a un vector con longitud 101 entre los evento1 y
%evento2
function vectorNormalizado= normalizar_tiempo(Matriz,Evento1,Evento2)
if (length(Matriz(:,1))>length(Matriz(1,:)))
    vectorNormalizado=zeros(101,length(Matriz(1,:)));
    for Cont=1:length(Matriz(1,:))
        Largo=Evento2-Evento1;
        XOriginal=0:Largo;
        XNuevo = 0 :Largo/100: Largo;
        vectorNormalizado(:,Cont)=interp1(XOriginal,Matriz(Evento1:Evento2,Cont),XNuevo);
    end
else
    vectorNormalizado=zeros(length(Matriz(:,1)),101);
    for Cont=1:length(Matriz(:,1))
        Largo=Evento2-Evento1;
        XOriginal=0:Largo;
        XNuevo = 0 :Largo/100: Largo;
        vectorNormalizado(Cont,:)=interp1(XOriginal,Matriz(Cont,Evento1:Evento2),XNuevo);
    end 
end
end