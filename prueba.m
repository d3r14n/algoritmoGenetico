clear all;
clc;
close all;

%% Parametros
numElem = 20;
umbral1s = 0.5;
umbralCruz = 0.8;
umbralMut = 0.9;
elemElitismo = 2;
numGeneraciones = 10;

%% Variables
patronX = codifPseudoBinaria( -360, 360 );
patronY = codifPseudoBinaria( -360, 360 );

%             printCodPseudBin(patronX);
%             printCodPseudBin(patronY);

%% Población inicial
[ pobX, valX ] = generarPob( numElem, umbral1s, patronX );
[ pobY, valY ] = generarPob( numElem, umbral1s, patronY );

valOrdX = sort( valX );
valOrdY = sort( valY );

%             figure; plot( valOrdX, 'o' );
%             figure; plot( valOrdY, 'o' );
%             
%% Población actual y sus patrones
pobActual(1, :, 1:size(pobX,2)) = pobX;
pobActual(2, :, 1:size(pobY,2)) = pobY;

patrones(1) = patronX;
patrones(2) = patronY;

%% Generaciones

[ fxy ] = funcionAdaptProy( valX, valY);
fxyHist = fxy;
for i = 1 : numGeneraciones
    [ pobNueva, valNuevos ] = generarSigPob( numElem, pobActual, fxy, patrones, elemElitismo, umbralCruz, umbralMut );
    [ fxy ] = funcionAdaptProy( valNuevos(1, :)', valNuevos(2, :)');
    fxyHist = horzcat( fxyHist , fxy );
end

%% Visualización
colorCode = ['b'; 'k'; 'r'; 'g'; 'y'; 'c'; 'm'];
ejeX = 1 : numElem;
figure;
plot(ejeX, fxyHist(:,1), 'b', 'Linewidth', 1); hold on
for i = 1 : numGeneraciones
    plot(ejeX, fxyHist(:,((i * 3) + 1)), colorCode(mod(i, 7) + 1), 'Linewidth', 1);
end
title('Comparación');
grid on;
hold off;

figure;
plot(ejeX, fxyHist(:,1), '*', 'Linewidth', 1); hold on
title('Población 0');
grid on;
hold off;
for i = 1 : numGeneraciones
    figure;
    plot(ejeX, fxyHist(:,((i * 3) + 1)), '*', 'Linewidth', 1); hold on
    title(['Población ' num2str(i)]);
    grid on;
    hold off;
end
[ vx, vy, vf ] = elemGanador(fxy, valNuevos);