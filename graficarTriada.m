% graficarTriada(V1,V2,V3,origen,frame,linewidth)
% 
% grafica tres vectores en matrices (frames×3) en el "frame" indicado con 
% cola en "origen".
% "origen" es una matriz (frames×3) con posiciones en el espacio.
% los vectores se grafican con cola en la posción de "origen" en el "frame"
% pasado en una escala de 1:10.
% ENTRADA
%   V1, V2 y V3: son marices de tamaño [n×3] donde cada fila representa a un
%   vector. La fila numero "frame" corresponde al vector que se va a
%   graficar. Los elementos son del tipo double.
%   origen: es una matriz de tamaño [n×3] donde cada fila representa una
%   pocision en el espacio. La fila numero "frame" corresponde a la posición
%   de origen de los vectores V1,V2 y V3. Los elementos son del tipo double.
%   frame: es el frame o nro de fila que se quiere graficar de las variables
%   anteriores. Es un entero (int) de tamaño [1×1].
%   linewidth: es un dato numerico mayor a cero (>0) y es directamente
%   proporcional al ancho del trazo del vector.
% 
% Autor: Marcos Dominguez
% Noviembre 2020

function graficarTriada(V1,V2,V3,origen,frame,linewidth)
v1=V1(frame,:)/10;
v2=V2(frame,:)/10;
v3=V3(frame,:)/10;
quiver3(origen(frame,1),origen(frame,2),origen(frame,3),v1(1),v1(2),v1(3),'r','linewidth',linewidth)
hold on
quiver3(origen(frame,1),origen(frame,2),origen(frame,3),v2(1),v2(2),v2(3),'g','linewidth',linewidth)
quiver3(origen(frame,1),origen(frame,2),origen(frame,3),v3(1),v3(2),v3(3),'b','linewidth',linewidth)
end