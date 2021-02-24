% Autor: Marcos Dominguez
% Noviembre 2020

% grafica tres vectores en matrices (frames×3) en el "frame" indicado con cola en "origen".
% "origen" es una matriz (frames×3) con posiciones en el espacio.
% los vectores se grafican con cola en la posción de "origen" en el "frame"
% pasado en una escala de 1:10.

function graficarTriada(V1,V2,V3,origen,frame,linewidth)
v1=V1(frame,:)/10;
v2=V2(frame,:)/10;
v3=V3(frame,:)/10;
quiver3(origen(frame,1),origen(frame,2),origen(frame,3),v1(1),v1(2),v1(3),'r','linewidth',linewidth)
hold on
quiver3(origen(frame,1),origen(frame,2),origen(frame,3),v2(1),v2(2),v2(3),'g','linewidth',linewidth)
quiver3(origen(frame,1),origen(frame,2),origen(frame,3),v3(1),v3(2),v3(3),'b','linewidth',linewidth)
end