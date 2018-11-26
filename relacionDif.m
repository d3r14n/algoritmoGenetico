%% Calcular la relaci+on difusa entre dos conjuntos
%% Entradas
%% C1, C2 Conjuntos  difusos (vector renglón)
%% Salida
%% R - matriz de relación

function [ R ] = relacionDif( C1, C2 )
    R = zeros(size(C1, 2), size(C2, 2));
    for i = 1 : size(C1, 2)
        for j = 1 : size(C2, 2)
            R(i, j) = min(C1(i), C2(j));
        end
    end

end

