%% Codificacion Psedobinaria de un rango de valores
%% cubre los casos     0 ..+valor
%%                     0 ..-valor
%%                 -valor..+valor
%% Entradas
%% valorIni - valor inicial del rango
%% valorFin - valor final del rango
%% Salida
%% Codigo - estructura que contiene los valores de cada
%%          posici?n para representar el rango
%%          contiene:
%%             signo - bandera booleana
%%             valIni - Valor inicial de donde parte el intervalo
%%             datos - valores numericos de cada posicion
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function[] = printCodPseudBin(codigo)
    fprintf("Valor inicial = %10.7f\n", codigo.valIni);
    if (codigo.signo)
        fprintf("Bandera de signo = Yes\n");
    else
        fprintf("Bandera de signo = No\n");
    end
    for i = 1 : size(codigo.datos, 2)
        if codigo.datos(i) == floor(codigo.datos(i))
            fprintf("%3d : %10d\n", i, codigo.datos(i));
        else
            fprintf("%3d : %13.12f\n", i, codigo.datos(i));
        end
    end
    
end

