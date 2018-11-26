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
patronX = codifPseudoBinaria( 0, 49.9999999999999999999 );
patronY = codifPseudoBinaria( -1000, 999.9999999999999999999999 );

printCodPseudBin(patronX);
printCodPseudBin(patronY);

%% Población inicial
[ pobX, valX ] = generarPob( numElem, umbral1s, patronX );
[ pobY, valY ] = generarPob( numElem, umbral1s, patronY );

valOrdX = sort( valX );
valOrdY = sort( valY );

figure; plot( valOrdX, 'o' );
figure; plot( valOrdY, 'o' );

%% Población actual y sus patrones
pobActual(1, :, 1:size(pobX,2)) = pobX;
pobActual(2, :, 1:size(pobY,2)) = pobY;

patrones(1) = patronX;
patrones(2) = patronY;


% %% Calificación de la población
% [ fxy ] = funcionAdapt1( valX, valY);
% 
% [ pobNueva, valNuevos ] = generarSigPob( numElem, pobActual, fxy, patrones, elemElitismo, umbralCruz, umbralMut );
% 
% 
% %% Calificación de la población nueva
% [ fxy2 ] = funcionAdapt1( valNuevos(1, :)', valNuevos(2, :)');
% 
% [ pobNueva2, valNuevos2 ] = generarSigPob( numElem, pobNueva, fxy2, patrones, elemElitismo, umbralCruz, umbralMut );
% 
% %% Calificación de la población nueva x2
% [ fxy3 ] = funcionAdapt1( valNuevos2(1, :)', valNuevos2(2, :)');

%% Generaciones

[ fxy ] = funcionAdapt1( valX, valY);
for i = 1 : numGeneraciones
    [ pobNueva, valNuevos ] = generarSigPob( numElem, pobActual, fxy, patrones, elemElitismo, umbralCruz, umbralMut );
    [ fxy ] = funcionAdapt1( valNuevos(1, :)', valNuevos(2, :)');
end

[ vx, vy, vf ] = elemGanador(fxy, valNuevos);

%% Visualización
% ejeX = 1 : numElem;
% figure;
% plot(ejeX, fxy(:,1), 'b', 'Linewidth', 3); hold on
% plot(ejeX, fxy2(:,1), 'r', 'Linewidth', 3);
% plot(ejeX, fxy3(:,1), 'g', 'Linewidth', 3); grid on; hold off


% %% Ejemplos
% [ elemxElitismo ] = selElitismo(fxy, 8);
% 
% [ par1 ] = selxPar(fxy);
% 
% [ parNuevo ] = cruzamiento( pobActual, patrones, par1);
% 
% parOriginal = zeros(size(parNuevo));
% parOriginal(1, 1, 1 : size(pobX, 2)) = pobActual(1, par1(1), 1 : size(pobX, 2));
% parOriginal(2, 1, 1 : size(pobY, 2)) = pobActual(2, par1(1), 1 : size(pobY, 2));
% parOriginal(1, 2, 1 : size(pobX, 2)) = pobActual(1, par1(2), 1 : size(pobX, 2));
% parOriginal(2, 2, 1 : size(pobY, 2)) = pobActual(2, par1(2), 1 : size(pobY, 2));
% 
% printElemPseudoBin(parOriginal)
% printElemPseudoBin(parNuevo)
