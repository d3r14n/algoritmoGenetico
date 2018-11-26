function [ vx, vy, vf ] = elemGanador( fxy, vals )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    
    vx = 0; vy = 0; vf = 0;
    
    winner = selElitismo( fxy, 1 );
     
    vx = vals(1, winner);
    vy = vals(2, winner);
    vf = fxy(winner, 1, 1);

end

