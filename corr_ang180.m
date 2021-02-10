% Noviebre 2020
% Autor:Marcos Dominguez

% Suaviza los saltos de +PI a -PI rad (+-180 grados)
function ANGULO= corr_ang180(vector)
if length(vector(:,1))>length(vector(1,:))
vector=vector';
flag=1;
end
aux=[0 vector];
ANGULO=[vector 0];
producto=aux.*ANGULO;

diferencia_abs=abs(ANGULO-aux);
multiplicador=ANGULO./abs(ANGULO);
diferencia_abs(diferencia_abs<1.2*pi)=0;
valores_repetidos=find(diferencia_abs.*producto<0);
if mod( length(valores_repetidos),2)==0

    for i=1:2:length(valores_repetidos)
        ANGULO(valores_repetidos(i):valores_repetidos(i+1)-1)=ANGULO(valores_repetidos(i):valores_repetidos(i+1)-1)-2*pi*multiplicador(valores_repetidos(i));
    end
    
else
    for i=1:2:length(valores_repetidos)-1
        ANGULO(valores_repetidos(i):valores_repetidos(i+1)-1)=ANGULO(valores_repetidos(i):valores_repetidos(i+1)-1)-2*pi*multiplicador(valores_repetidos(i));
    end
    ANGULO(valores_repetidos(length(valores_repetidos)):length(ANGULO))=ANGULO(valores_repetidos(length(valores_repetidos)):length(ANGULO))-2*pi*multiplicador(valores_repetidos(length(valores_repetidos)));
end
if flag==1
    ANGULO=(ANGULO(1:length(ANGULO)-1))';
end
end