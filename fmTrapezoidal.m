%% Funci�n de menbres�a tri�ngular
% Entradas
% x - Valor Menbres�a
% a - Valor Inicial
% b - Valor Inicial m�ximo
% c - Valor Final M�ximo
% d - Valor Final
% Salida 
% mx - Membres�a X

function [ mx ] = fmTrapezoidal( x, a, b, c, d )
    mx = 0;
    if((x >= a) && (x <= d))
        dato1 = 1;
        dato2 = 1;
        if (a == b)
            if(b == c)
                if(d == c)
                    mx = fmSingletone(x, a);
                else
                    mx = fmTriangular(x, a, a, d);
                end;
            else
                dato2 = (d - x) / (d - c);
            end;
        else
            if(b == c)
                mx = fmTriangular(x, a, b, d);
            else
                dato1 = (x - a) / (b - a);
                if(~(c == d))
                    dato2 = (d - x) / (d - c);
                end;
                mx = min(min(dato1, dato2), 1);
            end;
            
        end;
    end;
end

