clc;clear;
load('Datos.mat');
sys1=tf(1,[T 1]);
sys21=tf(wn1^2,[1 2*wn1*zi1 wn1^2]);
sys3=sys1*sys21
figure('Name','Sistema de Tercer Orden','NumberTitle','off','Color','white','Position',[0 20 1300 650]);
title('My Title')
subplot(1,2,1);
title('Sistema de Tercer Orden');
%w = linspace(8,10*pi,256); En caso de mayor resolucion poner en donde se
%quiere observar 
%h = bodeplot(sys3,w);
h = bodeplot(sys3);
setoptions(h,'FreqUnits','Hz');
grid on;
subplot(1,2,2);
nyquist(sys3);
grid on;


