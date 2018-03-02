clc;clear;
load('Datos.mat');
sys1=tf(1,[T 1]);
sys21=tf(wn1^2,[1 2*wn1*zi1 wn1^2]);
sys22=tf(wn2^2,[1 2*wn2*zi2 wn2^2]);
sys5=sys1*sys22*sys21;
figure('Name','Sistema de Quinto Orden','NumberTitle','off','Color','white','Position',[0 20 1300 650]);
subplot(1,2,1);
%w = linspace(8,10*pi,256); En caso de mayor resolucion
%h = bodeplot(sys5,w);
h = bodeplot(sys5);
setoptions(h,'FreqUnits','Hz','PhaseMatching','on','ConfidenceRegionNumberSD',2);
grid on;
subplot(1,2,2);
nyquist(sys5);
grid on;
ax = gca;