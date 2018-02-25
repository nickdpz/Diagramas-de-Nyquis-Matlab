%Segundo Orden 1
Mp1=2.26;
zi1=sqrt(((-log(Mp1/2-1)/pi)^2)/(1+(-log(Mp1/2-1)/pi)^2));
Tp1=3.86e-3;
wn1=pi/(Tp1*(sqrt(1-zi1^2)));
sys1=tf(wn1^2,[1 2*wn1*zi1 wn1^2])
Mp2=2.1;
zi2=sqrt(((-log(Mp2/2-1)/pi)^2)/(1+(-log(Mp2/2-1)/pi)^2));
Tp2=1.5e-3;
wn2=pi/(Tp2*(sqrt(1-zi2^2)));
sys2=tf(wn2^2,[1 2*wn2*zi2 wn2^2])
sys3=tf(1,[1/2000 1]);
sys5=sys1*sys2*sys3
bode(sys5);
