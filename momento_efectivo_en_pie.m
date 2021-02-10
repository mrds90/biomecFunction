% Autor:Marcos Dominguez
% Noviembre 2020
%FAAALTA
function [Mx, My, Mz]=momento_efectivo_en_pie(mx,my,mz,fx,fy,fz,centroDePresion,numeroDePlataforma)
centroPlataforma1=ones(length(centroDePresion(:,1)),length(centroDePresion(1,:)));
centroPlataforma2=centroPlataforma1;
centroPlataforma1(:,1)=[centroPlataforma1(:,1)*0.3,centroPlataforma1(:,2)*-0.4,centroPlataforma1(:,3)*0];
centroPlataforma2(:,1)=[centroPlataforma2(:,1)*0.9,centroPlataforma2(:,2)*-0.4,centroPlataforma2(:,3)*0];
n0=[mx,my,mz];
f=[fx,fy,fz];
if numeroDePlataforma==1
    momentoPlataforma=n0-cross((centroDePresion-centroPlataforma1),f);
if numeroDePlataforma==2
    momentoPlataforma=n0-cross((centroDePresion-centroPlataforma2),f);
end

Mx=momentoPlataforma(:,1);
My=momentoPlataforma(:,2);
Mz=momentoPlataforma(:,3);




end