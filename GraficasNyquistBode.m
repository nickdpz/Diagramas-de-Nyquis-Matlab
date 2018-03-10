%definicion de parametros de los filtros
tau = 1/2000;
w1 = 1000 ;
zeta1 = 0.5 ;
w2 = 3000 ;
zeta2 = 0.7 ;

%definiciondelos filtros de primer y segundo orden
sys1 = tf(1,[tau 1]);%G1(s)
sys2a = tf(w1^2,[1 2*zeta1*w1 w1^2]);%G2(s)
sys2b = tf(w2^2,[1 2*zeta2*w2 w2^2]);%G3(s)

%sistema de orden3
sys3=sys1*sys2a;
[mag,phase,wout] = bode(sys3);
f3=wout/(2*pi);     mag3=20*log10(squeeze(mag));    p3=squeeze(phase);

%systemasdeorden4
sys4=sys2a*sys2b;
[mag,phase,wout] = bode(sys4);
f4=wout/(2*pi);     mag4=20*log10(squeeze(mag));    p4=squeeze(phase);

%systemasdeorden5
sys5=sys1*sys2a*sys2b;
[mag,phase,wout] = bode(sys5);
f5=wout/(2*pi);     mag5=20*log10(squeeze(mag));    p5=squeeze(phase);

datos = csvread("Datos Experimentales/TercerOrden.csv",1,0);
f=datos(:,1);
m=20*log10(datos(:,3));
p=-(datos(:,2));

figure
%Grafica de bode
subplot(2,1,1);
semilogx(f,m,'o');
hold on;
semilogx(f3',mag3','-.black');
hold on;
% semilogx(f4',mag4','-red');
% hold on;
% semilogx(f5',mag5','--blue');
hold on;
grid on;
dy=15;
text(f(1,1),m(1,1)-dy,{'\uparrow',[num2str(f(1,1)),' Hz']},'HorizontalAlignment','center');
text(f(2,1),m(2,1)+dy,{[num2str(f(2,1)),' Hz'],'\downarrow'},'HorizontalAlignment','center');
text(f(3,1),m(3,1)-dy,{'\uparrow',[num2str(f(3,1)),' Hz']},'HorizontalAlignment','center');
text(f(4,1),m(4,1)+dy,{[num2str(f(4,1)),' Hz'],'\downarrow'},'HorizontalAlignment','center');
text(f(5,1),m(5,1)-dy,{'\uparrow',[num2str(f(5,1)),' Hz']},'HorizontalAlignment','center');
text(f(6,1),m(6,1)+dy,{[num2str(f(6,1)),' Hz'],'\downarrow'},'HorizontalAlignment','center');
text(f(7,1),m(7,1)-dy,{'\uparrow',[num2str(f(7,1)),' Hz']},'HorizontalAlignment','center');

% s=size(m);
% for i=1:ar(1)
%     text(f(i,1),m(i,1)+20-3*i,strcat('\downarrow f = ',num2str(f(i,1))));
% end
xmin=50;
xmax=4000;
title('Filtro Cuarto Orden');
xlabel('Frecuencia [Hz]');
legend('practico','Tercer Orden');
legend('Location','northeast');
legend('boxoff');
xlim([xmin xmax]);
ylim([-70 30]);

%Fase bode
subplot(2,1,2);
semilogx(f,p,'o');
hold on;
semilogx(f3',p3','-.black');
hold on;
dy1=70;
text(f(1,1),p(1,1)-dy1,{'\uparrow',strcat(num2str(p(1,1),3),'°')},'HorizontalAlignment','center');
text(f(2,1),p(2,1)+dy1,{strcat(num2str(p(2,1),3),'°'),'\downarrow'},'HorizontalAlignment','center');
text(f(3,1),p(3,1)-dy1,{'\uparrow',strcat(num2str(p(3,1),3),'°')},'HorizontalAlignment','center');
text(f(4,1),p(4,1)+dy1,{strcat(num2str(p(4,1),3),'°'),'\downarrow'},'HorizontalAlignment','center');
text(f(5,1),p(5,1)-dy1,{'\uparrow',strcat(num2str(p(5,1),3),'°')},'HorizontalAlignment','center');
text(f(6,1),p(6,1)+dy1,{strcat(num2str(p(6,1),3),'°'),'\downarrow'},'HorizontalAlignment','center');
text(f(7,1),p(7,1)-dy1,{'\uparrow',strcat(num2str(p(7,1),3),'°')},'HorizontalAlignment','center');
xlim([xmin xmax]);
ylim([-380 50])
% semilogx(f4',p4','-red');
% hold on;
% semilogx(f5',p5','--blue');
% grid on;

%Diagrama de Nyquist
% subplot(3,1,3);
% w = linspace(-7000*pi,7000*pi,1024);
% [re,im,wout] = nyquist(sys4,w);
% re = squeeze(re);
% im = squeeze(im);
% plot(re,im,':k');
% xlabel('Real Axis');
% ylabel('Imaginary Axis');