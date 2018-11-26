%% Funci�n de Membres�a gaussiana
% Entradas
% x - Valor al cual se calcula la membres�a
% media - Valor de la media
% sigma - Valor de la desv. est�ndar
% Salida
% mx - membres�a de x

function [ mx ] = fmGaussiana( x, media, sigma )

    mx = 0;
    if(~(sigma == 0))
        valor = ((x - media) / sigma)^2;
        mx = exp(-valor);
        if(mx < 0.001)
            mx = 0;
        end
    end
end

