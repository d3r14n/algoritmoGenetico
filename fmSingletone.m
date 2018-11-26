%%

function [ mx ] = fmSingletone( x, media )
    mx = 0;
    epsilon = 0.001;
    valorIni = media - epsilon;
    valorFin = media + epsilon;
    
    if(x >= valorIni && x <= valorFin)
        mx = 1;
    end

end

