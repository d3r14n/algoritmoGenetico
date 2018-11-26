%% Función de menbresía triángular
% Entradas
% x - Valor Menbresía
% a - Valor Inicial
% b - Valor Inicial máximo
% c - Valor Final Máximo
% d - Valor Final
% Salida 
% mx - Membresía X

function [ mx ] = fmTrapezoidal2( x, a, b, c, d )
    mx = 0;
    if((x >= a) && (x <= d))
        dato1 = 1;
        dato2 = 1;
        if (a == b)
            if(b == c)
                if(d == c)
                    if(x == a)
                        mx = 1;
                    end;
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
            end;
            mx = min(min(dato1, dato2), 1);
        end;
        
    end;
end

