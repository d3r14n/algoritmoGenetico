clear all;
clc;
close all;

x = zeros(721,1);
y = zeros(721,1);

for i = -360 : 360
    pos = i + 361;
    x(pos, 1) = i;
    y(pos, 1) = i;
end

[ fxyEx ] = funcionAdaptProy( x, y);

figure
plot(x, fxyEx(:, 1, 1));

ProdCart = prodFuncProy(x, y);

figure;
surf(ProdCart)
title('Prod Cartesiano');
colorbar;