%% Funci�n de Membres�a campana
% Entradas
% x - Valor al cual se calcula la membres�a
% media - Valor de la media
% omega - Valor de la pendiente
% Salida
% mx - membres�a de x

function [ mx ] = fmSigmoidal( x, media, omega )
    mx = 0;
    valor = exp(-omega * (x - media));
    mx = 1 / (1 + valor);
    if(mx < 0.001)
        mx = 0;
    end
end