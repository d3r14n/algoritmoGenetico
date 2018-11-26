%% Prodcto y coproducto cartesiano
% Entrada
% C1, C2 Conjuntos difusos
% indicador 1 - producto cartesiano
%           2 - coproducto cartesiano
% Salida
% C1xC2 - matriz del producto cartesiano

function [ C1xC2 ] = prodFuncProy( C1, C2 )
    C1xC2 = zeros(size(C1, 1), size(C2, 1));
    for i = 1: size(C1, 1)
        for j = 1: size(C2, 1)
            val1 = sind(C1(i, :));
            val2 = cosd(C2(j, :));
            val3 = sqrt(abs(C1(i, :) - C2(i, :)));
            res = abs(val1 + val2 + val3);
            C1xC2(i, j) = res;
        end
    end

end

