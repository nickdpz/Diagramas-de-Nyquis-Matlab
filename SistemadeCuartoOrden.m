clc;clear;
load('Datos.mat');
%sys1=tf(1,[T 1]);
sys21=tf(wn1^2,[1 2*wn1*zi1 wn1^2]);
sys22=tf(wn2^2,[1 2*wn2*zi2 wn2^2]);
sys4=sys22*sys21;
w = logspace(0,4,1000);
%Obtencion de Datos Experimentales
datos = csvread("DatosExperimentales/CuartoOrden.csv",0,0);
f=(datos(:,1))';
p=(datos(:,2))';
p=p*(pi/180);
m=(datos(:,3))';
[x,y] = pol2cart(p,m);
figure('Name','Sistema de Tercer Orden','NumberTitle','off','Color','white','Position',[0 20 900 650]);
h = nyquistplot(sys4,w);
setoptions(h,'FreqUnits','Hz','ShowFullContour','off','PhaseUnits','deg','MagUnits','abs');hold on;grid on;
plot(x,y,'o','LineWidth',2,'Color','red');hold on;
i=1;
while(i<=length(f))
    if(mod(i,2)==1)
        text(x(i)-0.05,y(i)-0.1,['f [Hz] ',num2str(f(i))]);
    else
        text(x(i)-0.05,y(i)+0.1,['f [Hz] ',num2str(f(i))]);
    end
    i=i+1;
end

%Modificacion de parametros de grafica
title({'Nyquist Sistema de Cuarto Orden';''},'FontSize',13,'Color', 'blue');
legend('Respuesta Matlab','Datos Reales')
legend('Location','southwest');
ax = gca; 
ax.YLim = [-1.3 0.3];
ax.XLim = [-0.8 1.1];