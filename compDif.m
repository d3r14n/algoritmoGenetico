%% Composici�n de relaciones difusas
%% Entradas 
%% R1 - Relaci�n 1 tama�o nxm
%% R2 - Relaci�n 2 tama�o mxr
%% indicador - tipo de composici�n
%%              1 - Max-min
%%              2 - Max-prod
%% Salida
%% R3 - Relaci�n compuesta tama�o rxm

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

