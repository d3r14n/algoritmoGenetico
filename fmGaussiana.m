%% Función de Membresía gaussiana
% Entradas
% x - Valor al cual se calcula la membresía
% media - Valor de la media
% sigma - Valor de la desv. estándar
% Salida
% mx - membresía de x

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

