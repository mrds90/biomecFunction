function [MLaG , MGaL]=calcular_matrices_g_a_l(i,j,k)
    MLaG=cat(3,i,j,k);
    MLaG=permute(MLaG,[2 3 1]);
    MGaL=permute(MLaG,[2 1 3]);
end