clc;
clear all;
close all;

x = 0:150;

for i=1:size(x,2)
    ft1(i) = fmTriangular(x(i), 65, 80, 120);
    ft2(i) = fmTriangular(x(i), 80, 80, 110);
    ft3(i) = fmTriangular(x(i), 60, 95, 95);
    ft4(i) = fmTriangular(x(i), 100, 100, 100);
    
    ftp1(i) = fmTrapezoidal(x(i), 65, 65, 65, 120);
    ftp2(i) = fmTrapezoidal(x(i), 80, 100, 100, 140);
    ftp3(i) = fmTrapezoidal(x(i), 80, 120, 120, 120);
    ftp4(i) = fmTrapezoidal(x(i), 100, 100, 100, 100);
    ftp5(i) = fmTrapezoidal(x(i), 80, 80, 140, 150);
    ftp6(i) = fmTrapezoidal(x(i), 90, 100, 120, 120);
    
    fg1(i) = fmGaussiana(x(i), 80, 5);
    fg2(i) = fmGaussiana(x(i), 80, 10);
    fg3(i) = fmGaussiana(x(i), 80, 15);
    fg4(i) = fmGaussiana(x(i), 80, 20);
    
    fgn1(i) = fmGaussiana(x(i), 80, -5);
    fgn2(i) = fmGaussiana(x(i), 80, -10);
    fgn3(i) = fmGaussiana(x(i), 80, -15);
    fgn4(i) = fmGaussiana(x(i), 80, -20);
    
    fc1(i) = fmCampana(x(i), 80, 15, 1);
    fc2(i) = fmCampana(x(i), 80, 20, 1);
    fc3(i) = fmCampana(x(i), 80, 15, 10);
    fc4(i) = fmCampana(x(i), 80, 20, 10);
    
    fs1(i) = fmSigmoidal(x(i), 80, 0.05);
    fs2(i) = fmSigmoidal(x(i), 80, 0.1);
    fs3(i) = fmSigmoidal(x(i), 80, -0.1);
    fs4(i) = fmSigmoidal(x(i), 80, -0.05);
    fs5(i) = fmSigmoidal(x(i), 80, 0.5);
    fs6(i) = fmSigmoidal(x(i), 80, 0.2);
    fs7(i) = fmSigmoidal(x(i), 80, -0.2);
    fs8(i) = fmSigmoidal(x(i), 80, -0.5);
end;

ftp2 = ftp2 * 0.9;

Union = max(ftp2, fg4);
Intersec = min(ft1, fc4);
Comp1 = 1 - ftp2;
Comp2 = 1 - fc4;

ProdCart = prodCartesiano(ftp2, fc4, 1);
coProdCart = prodCartesiano(ftp2, fc4, 2);

figure;
 plot(x, ftp2, 'b', 'Linewidth', 3); hold on;
 plot(x, fg4, 'g', 'Linewidth', 3);
 plot(x, Comp1, '--k', 'Linewidth', 3);
 plot(x, Union, '--r', 'Linewidth', 3);
 title('Funciones');
legend('f1', 'f2', 'f3', 'f4', 'g1', 'Location', 'northeastoutside');
xlabel('x');
ylabel('m(x)');
axis([min(x) max(x) 0 1.05]);
grid on;
hold off;

figure;
 plot(x, ftp1, 'b', 'Linewidth', 3); hold on;
 plot(x, fc4, 'g', 'Linewidth', 3);
 title('wut');
legend('f1', 'f2', 'f3', 'f4', 'g1', 'Location', 'northeastoutside');
xlabel('x');
ylabel('m(x)');
axis([min(x) max(x) 0 1.05]);
grid on;
hold off;

figure;
surf(ProdCart)
title('Prod Cartesiano');
colorbar;
xlabel('x');
ylabel('m(x)');
axis([min(x) max(x) min(x) max(x) 0 1.05]);
grid on;
hold off;

figure;
surf(coProdCart)
title('Coprod Cartesiano');
colorbar;
xlabel('x');
ylabel('m(x)');
axis([min(x) max(x) min(x) max(x) 0 1.05]);
grid on;
hold off;

figure;
 plot(x, ft1, 'b', 'Linewidth', 3); hold on;
 plot(x, fc4, 'g', 'Linewidth', 3);
 plot(x, Comp2, '--k', 'Linewidth', 3);
 plot(x, Intersec, '--r', 'Linewidth', 3);
 title('Funciones');
legend('f1', 'f2', 'f3', 'f4', 'g1', 'Location', 'northeastoutside');
xlabel('x');
ylabel('m(x)');
axis([min(x) max(x) 0 1.05]);
grid on;
hold off;

% figure;
% plot(x, ft1, 'b', 'Linewidth', 3); hold on;
% plot(x, ft2, 'g', 'Linewidth', 3);
% plot(x, ft3, 'r', 'Linewidth', 3);
% plot(x, ft4, 'm', 'Linewidth', 3);
% % plot(x, fg1, 'c', 'Linewidth', 3);
% title('Funciones Triángulares');
% legend('f1', 'f2', 'f3', 'f4', 'g1', 'Location', 'northeastoutside');
% xlabel('x');
% ylabel('m(x)');
% axis([min(x) max(x) 0 1.05]);
% grid on;
% hold off;
% 
% figure;
% plot(x, fg1, 'r', 'Linewidth', 3); hold on;
% plot(x, fg2, 'g', 'Linewidth', 3);
% plot(x, fg3, 'b', 'Linewidth', 3);
% plot(x, fg4, 'm', 'Linewidth', 3);
% title('Funciones Gaussiana');
% legend('f1', 'f2', 'f3', 'f4', 'g1', 'Location', 'northeastoutside');
% xlabel('x');
% ylabel('m(x)');
% axis([min(x) max(x) 0 1.05]);
% grid on;
% hold off;
% 
% figure;
% plot(x, fgn1, 'r', 'Linewidth', 3); hold on;
% plot(x, fgn2, 'g', 'Linewidth', 3);
% plot(x, fgn3, 'b', 'Linewidth', 3);
% plot(x, fgn4, 'm', 'Linewidth', 3);
% title('Funciones Gaussiana Negativa');
% legend('f1', 'f2', 'f3', 'f4', 'g1', 'Location', 'northeastoutside');
% xlabel('x');
% ylabel('m(x)');
% axis([min(x) max(x) 0 1.05]);
% grid on;
% hold off;

% figure;
% plot(x, fc1, 'r', 'Linewidth', 3); hold on;
% plot(x, fc2, 'g', 'Linewidth', 3);
% plot(x, fc3, 'b', 'Linewidth', 3);
% plot(x, fc4, 'm', 'Linewidth', 3);
% title('Funciones Campana');
% legend('f1', 'f2', 'f3', 'f4', 'g1', 'Location', 'northeastoutside');
% xlabel('x');
% ylabel('m(x)');
% axis([min(x) max(x) 0 1.05]);
% grid on;
% hold off;
% 
% figure;
% plot(x, fs1, 'r', 'Linewidth', 3); hold on;
% plot(x, fs2, 'g', 'Linewidth', 3);
% plot(x, fs3, 'b', 'Linewidth', 3);
% plot(x, fs4, 'm', 'Linewidth', 3);
% plot(x, fs5, 'c', 'Linewidth', 3);
% plot(x, fs6, 'k', 'Linewidth', 3);
% plot(x, fs7, 'y', 'Linewidth', 3);
% plot(x, fs8, '-r', 'Linewidth', 3);
% title('Funciones Sigmoidal');
% legend('f1', 'f2', 'f3', 'f4', 'g1', 'Location', 'northeastoutside');
% xlabel('x');
% ylabel('m(x)');
% axis([min(x) max(x) 0 1.05]);
% grid on;
% hold off;
% 
% figure;
% plot(x, ftp1, 'r', 'Linewidth', 3); hold on;
% plot(x, ftp2, 'g', 'Linewidth', 3);
% plot(x, ftp3, 'b', 'Linewidth', 3);
% plot(x, ftp4, 'm', 'Linewidth', 3);
% plot(x, ftp5, 'y', 'Linewidth', 3);
% plot(x, ftp6, 'k', 'Linewidth', 3);
% title('Funciones Trapezoidales');
% legend('f1', 'f2', 'f3', 'f4', 'Location', 'northeastoutside');
% xlabel('x');
% ylabel('m(x)');
% axis([min(x) max(x) 0 1.05]);
% grid on;
% hold off;
% grid on;
% hold off;
