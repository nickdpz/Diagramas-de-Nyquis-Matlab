clc;clear;
%Obtencion de datos teoricos
load('Datos.mat');
sys1=tf(1,[T 1]);
sys21=tf(wn1^2,[1 2*wn1*zi1 wn1^2]);
sys3=sys1*sys21;
w = logspace(0,4,1000);
[mag,phase] = bode(sys3,w);
mag=reshape(mag(1,1,:),[1 1000]);
phase=reshape(phase(1,1,:),[1 1000]);
fout=w/(2*pi);
%Obtencion de Datos Experimentales
datos = csvread("DatosExperimentales/TercerOrden.csv",0,0);
f=(datos(:,1))';
p=(datos(:,2))';
m=(datos(:,3))';
figure('Name','Sistema de Tercer Orden','NumberTitle','off','Color','white','Position',[0 20 900 650]);
subplot(2,1,1);
semilogx(fout,10*log(mag),'LineWidth',2);hold on;
semilogx(f,10*log(m),'o','LineWidth',2);
%Modificacion de parametros de grafica
title({'Magnitud Sistema de Tercer Orden';''},'FontSize',13,'Color', 'blue');
xlabel('Frecuencia [Hz]','FontSize',12,'FontWeight','bold');
ylabel('Ganancia [dB]','FontSize',12,'FontWeight','bold');
legend('Respuesta Matlab','Datos Reales')
legend('Location','southwest');
ax = gca;
ax.XLim = [0, 1.5e3]; 
ax.YLim = [-60,5]; 
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.GridLineStyle = '--';
ax.GridColor = [0 0 0];
ax.GridAlpha = 0.55;
outerpos = ax.OuterPosition;
ti = ax.TightInset; 
left = outerpos(1) + 2.5*ti(1);
bottom = outerpos(2)+ti(2);
ax_width = outerpos(3) - 4*ti(1);
ax_height = outerpos(4) - ti(2) - ti(4);
ax.Position = [left bottom ax_width ax_height];
subplot(2,1,2);
semilogx(fout,phase,'LineWidth',2);hold on;
semilogx(f,p,'o','LineWidth',2);
title('Fase Sistema de Tercer Orden','FontSize',13,'Color', 'blue');
xlabel('Frecuencia [Hz]','FontSize',12,'FontWeight','bold');
ylabel('Fase [Deg]','FontSize',12,'FontWeight','bold');
legend('Respuesta Matlab','Datos Reales')
legend('Location','southwest');
ax = gca;
%Modificacion de parametros de grafica
ax.XLim = [0, 1.5e3];  
ax.YLim = [-270,5]; 
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.GridLineStyle = '--';
ax.GridColor = [0 0 0];
ax.GridAlpha = 0.55;
outerpos = ax.OuterPosition;
left = outerpos(1) + 2.5*ti(1);
bottom = outerpos(2)+ti(2);
ax_width = outerpos(3) - 4*ti(1);
ax_height = outerpos(4) - ti(2) - ti(4);
ax.Position = [left bottom ax_width ax_height];