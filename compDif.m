%% Composición de relaciones difusas
%% Entradas 
%% R1 - Relación 1 tamaño nxm
%% R2 - Relación 2 tamaño mxr
%% indicador - tipo de composición
%%              1 - Max-min
%%              2 - Max-prod
%% Salida
%% R3 - Relación compuesta tamaño rxm

function [ R3 ] = compDif( R1, R2, indicador )
    R3 = 0;
    if(size(R1, 2) == size(R2, 1))
        R3 = zeros(size(R1, 1), size(R2, 2));
        for i = 1 : size(R1, 1)
           for j = 1 : size(R2, 2)
               valores = zeros(size(R1, 2), 1);
               for k = 1 : size(R1, 2)
                   if(indicador == 1) %% max min
                       valores(k) = min(R1(i,k), R2(k, j));
                   else %% max prod
                       valores(k) = R1(i,k) * R2(k, j);
                   end
               end
               R3(i, j) = max(valores);
           end
        end
    end
end

