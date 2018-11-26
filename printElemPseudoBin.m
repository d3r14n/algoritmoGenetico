%% Codificacion de elementos Codificados Pseudobinariamente
%% cubre los casos     0 ..+valor
%%                     0 ..-valor
%%                 -valor..+valor
%% Entradas
%% Elementos - Matriz variables x elementos x datos
%% Salida
%% Codigo - estructura que contiene los valores de cada
%%          posici?n para representar el rango
%%          contiene:
%%             signo - bandera booleana
%%             valIni - Valor inicial de donde parte el intervalo
%%             datos - valores numericos de cada posicion
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function[] = printElemPseudoBin( elementos )
    
    fprintf("# Elem.     Var 1               Var 2 \n");
    for i = 1 : size(elementos, 2)
        fprintf("%2d.", i);
        for j = 1 : size(elementos, 1)
            fprintf(" [%2d]", j);
            for k = 1 : size(elementos, 3)
                fprintf("%2d", elementos(j, i, k));
            end
        end
        fprintf("\n");
    end
end

