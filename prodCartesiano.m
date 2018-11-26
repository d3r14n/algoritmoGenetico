%% Prodcto y coproducto cartesiano
% Entrada
% C1, C2 Conjuntos difusos
% indicador 1 - producto cartesiano
%           2 - coproducto cartesiano
% Salida
% C1xC2 - matriz del producto cartesiano

function [ C1xC2 ] = prodCartesiano( C1, C2, indicador )
    C1xC2 = zeros(size(C1, 2), size(C2, 2));
    for i = 1: size(C1, 2)
        for j = 1: size(C2, 2)
            if indicador == 1 %% prod. Cartesiano
                C1xC2(i,j) = min(C1(i), C2(j));
            else %% coprod. Cartesiano
                C1xC2(i,j) = max(C1(i), C2(j));
            end
        end
    end

end

