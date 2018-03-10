clc;clear;
load('Datos.mat');
%sys1=tf(1,[T 1]);
sys21=tf(wn1^2,[1 2*wn1*zi1 wn1^2]);
sys22=tf(wn2^2,[1 2*wn2*zi2 wn2^2]);
sys4=sys22*sys21;
figure('Name','Sistema de Cuarto Orden','NumberTitle','off','Color','white','Position',[0 20 1300 650]);
subplot(1,2,1);
mag,phase,wout] = bode(sys4);
w = linspace(0,10*pi,256); EN caso de mayor resolucion
%h = bodeplot(sys4,w);
h = bodeplot(sys4);
setoptions(h,'FreqUnits','Hz','PhaseMatching','on','ConfidenceRegionNumberSD',2);
grid on;
subplot(1,2,2);
nyquist(sys4);
grid on;