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
f3=wout/(2*pi);     mag3=20*log10(squeeze(mag));

%systemasdeorden4
sys4=sys2a*sys2b;
[mag,phase,wout] = bode(sys4);
f4=wout/(2*pi);     mag4=20*log10(squeeze(mag));

%systemasdeorden5
sys5=sys1*sys2a*sys2b;
[mag,phase,wout] = bode(sys5);
f5=wout/(2*pi);     mag5=20*log10(squeeze(mag));

figure
%Grafica de bode
subplot(2,1,1);
semilogx(f3',mag3','-.black');
hold on;
semilogx(f4',mag4','-red');
hold on;
semilogx(f5',mag5','--blue');
grid on;

title('Filtro Cuarto Orden');
xlabel('Frecuencia [Hz]');
legend('Tercer Orden','Cuarto Orden','Quinto Orden');
legend('Location','northeast');
legend('boxoff');
xlim([0 1000])
ylim([-5 2])

subplot(2,1,2);
%Diagrama de Nyquist
w = linspace(-7000*pi,7000*pi,1024);
[re,im,wout] = nyquist(sys5,w);
re = squeeze(re);
im = squeeze(im);
plot(re,im,':k');
xlabel('Real Axis');
ylabel('Imaginary Axis');