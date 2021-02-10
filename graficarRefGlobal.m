% Autor: Marcos Dominguez
% Noviembre 2020

function graficarRefGlobal
quiver3(0,0,0,0.3,0,0,'r')
hold on
quiver3(0,0,0,0,0.3,0,'g')
quiver3(0,0,0,0,0,0.3,'b')
xlabel('X')
ylabel('Y')
zlabel('Z')
axis equal
grid on
grid minor
end