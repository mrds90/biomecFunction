function contactos=orden_de_pisada(rhs1,lhs1)
    if (rhs1 < lhs1) 
        contactos = {'r','l'};
    else
        contactos = {'l','r'};
    end
end