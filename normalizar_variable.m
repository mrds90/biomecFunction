function A=normalizar_variable(matriz,varargin)
A=matriz;
for i=1:nargin-1
    A=A/varargin{1,i};
end
end