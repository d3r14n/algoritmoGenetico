%% Genera la siguiente poblacion de n elementos considerando 
%% el patron de codificacion
%% Entradas
%% n - Numero de elementos de la poblacion
%% pobActual - Un vector con las variables actuales de la poblaci?n
%%             Ejem: 1 - pobX, 2 - pobY, 3 - pobZ, etc.
%% fXYZW -  1er columna valor real de la funcion dado los par?metros 
%%                  x y y recibidos
%%      2da columna probabilidad de la funcion
%%      3er columna prob. acumulada de la funcion
%% patrones - Un vector de los patrones las variables
%%            Ejem: 1 - patron X, 2 - patron Y, 3 - patron Z, etc.
%%          - Cada uno es estructura que contiene los valores de cada
%%          posici?n para representar el rango. Contiene:
%%             signo - bandera booleana
%%             valIni - Valor inicial de donde parte el intervalo
%%             datos - valores numericos de cada posicion
%% elemElitismo - n?mero de elementos a pasar por elitismo
%% umbralCruz   - umbral de cruzamiento
%% umbralMut    - umbral de mutacion
%% Salida:
%% pobNueva - Un vector con las variables nuevos de la poblaci?n
%%             Ejem: 1 - pobX, 2 - pobY, 3 - pobZ, etc.
%% valNuevos - Un vector con los valores nuevos de la poblaci?n
%%             Ejem: 1 - valores X, 2 - valores Y, 3 - valores Z, etc.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ pobNueva, valNuevos ] = generarSigPob( n, pobActual, funcionXYZW, ...
                                              patrones, elemElitismo, ...
                                              umbralCruz, umbralMut )
                                          
   pobNueva=zeros(size(pobActual));
   numVariables=size(pobActual,1);
   valNuevos = zeros(numVariables, n);
   cont=0;
   %% seleccion por elitismo
   if (elemElitismo>0)
       [ winners ] = selElitismo( funcionXYZW, elemElitismo );
       for cont=1:elemElitismo
           for i=1:numVariables
               pobNueva(i,cont,:)=pobActual(i,winners(cont),:);
           end
       end
   end
   
%    fprintf("Población con elitismo /n");
%    printElemPseudoBin(pobNueva);
   
   %% seleccion por pares
   while (cont<n)
       [ par ] = selxPar( funcionXYZW);
       valAleat=rand(1);
       if (valAleat>umbralCruz)
           %% hacer el cruzamiento de codigos
           [ parNuevo ] = cruzamiento( pobActual, patrones, par);
       end
       for j=1:2
          cont=cont+1;
          for i=1:numVariables
              if (valAleat>umbralCruz)
                pobNueva(i,cont,:)=parNuevo (i,j,:);
              else
                pobNueva(i,cont,:)=pobActual(i,par(j),:);  
              end
          end
       end             
   end
   
%    fprintf("Población con pares /n");
%    printElemPseudoBin(pobNueva);
   
   %% mutacion de los elementos que no ingresaron por elitismo
   
   for j = (elemElitismo + 1) : n
       for i = 1 : numVariables
           for k = 1 : size(pobNueva, 3)
               valAleat=rand(1);
               if (valAleat>umbralMut)
                    if(pobNueva(i, j, k) == 1)
                        pobNueva(i, j, k) = 0;
                    else
                        pobNueva(i, j, k) = 1;
                    end
               end
           end
       end
   end
   
%    fprintf("Población con mutación /n");
%    printElemPseudoBin(pobNueva);
   
   %% interpretación numérica de los elementos
   for i=1:numVariables   
        pob(:,:)=pobNueva(i,:,:);
        valNuevos(i,:)=deCodifPseudoBinaria(pob, patrones(i));
   end
end