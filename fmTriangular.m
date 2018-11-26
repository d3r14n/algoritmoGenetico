%% Funci�n de menbres�a tri�ngular
% Entradas
% x - Valor menbres�a
% a - Valor inicial
% b - Valor M�ximo
% c - Valor Final
% Salida 
% mx - Membres�a X

function [ mx ] = fmTriangular( x, a, b, c )
    mx = 0;
    if((x >= a) && (x <= c))
        dato1 = 1;
        dato2 = 1;
        if (a == b)
            if(b == c)
                mx = fmSingletone(x, a);
            else
                dato2 = (c - x) / (c - b);
            end;
        else
            dato1 = (x - a) / (b - a);
            if(~(b == c))
                dato2 = (c - x) / (c - b);
            end;
        end;
        mx = min(dato1,dato2);
    end;
end

