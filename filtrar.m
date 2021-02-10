function ESTRUCTURA_FILTRADA=filtrar(fc,orden,MARCADORES,frecuenciaDeMestreo)
Wc=2*fc/frecuenciaDeMestreo; % frecuencia de corte normalizada
[a,b] = butter(orden,Wc);
ESTRUCTURA_FILTRADA=filtrar_estructutra(MARCADORES,a,b);
end