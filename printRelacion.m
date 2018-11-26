%% Imprime una relación difusa
%% Entradas
%% R - Relación
%% xs - Elementos por renglón
%% ys - Elementos por columna

function [  ] = printRelacion( R, xs, ys, letrero )
    fprintf('%s\n', letrero);
    fprintf('==========================================================================\n|');
    fprintf('      |');
    for j = 1 : size(R, 2)
        fprintf('%6d|', ys(j));
    end
    fprintf('\n');
    fprintf('==========================================================================\n');
        
    for i = 1 : size(R, 1)
        fprintf('|%5d |', xs(i));
        for j = 1 : size(R, 2)
            fprintf('%5.2f |', R(i, j));
        end
        fprintf('\n');
    end
    fprintf('\n');
end

