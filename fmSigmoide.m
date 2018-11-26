%% Funci�n de Membres�a campana
% Entradas
% x - Valor al cual se calcula la membres�a
% media - Valor de la media
% omega - Valor de la pendiente
% Salida
% mx - membres�a de x

function [ mx ] = fmSigmoide( x, media, omega )
    mx = 0;
    if(~(sigma == 0))
        valor = ((x - media) / sigma)^(2 *  omega);
        mx = 1 / (1 + valor);
        if(mx < 0.001)
            mx = 0;
        end
    end

end