%% Cuantifica la funcion f(x,y) para los valores 
%% recibidos de x y y
%% Entrada
%% x - Valores de x
%% y - Valores de y
%% Salidas
%% fxy  1er columna valor real de la funcion dado los par?metros 
%%                  x y y recibidos
%%      2da columna probabilidad de la funcion
%%      3er columna prob. acumulada de la funcion
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ fxy ] = funcionAdaptProy( x, y )
   val1 = sind(x);
   val2 = cosd(y);
   val3 = sqrt(abs(x-y));
   fxy = abs(val1 + val2 + val3);
   
   sumaFn=sum(abs(fxy));
   
   fxy(:,2)=abs(fxy(:,1))/sumaFn; %% probabilidad de la funcion
   fxy(1,3)=0;
   fxy(1,3)=fxy(1,2);
   for i=2:size(fxy,1)
       fxy(i,3)=fxy(i-1,3)+fxy(i,2); %% prob. acumulada de la funcion
   end;
end
