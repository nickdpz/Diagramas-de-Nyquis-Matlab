%Coeficientes para caraterizar un sistema de Primer o Segundo Orden 
clc;clear;
%Primer Orden
T=531e-6;
%Segundo Orden 1
Mp1=2.218;
zi1=sqrt(((-log(Mp1/2-1)/pi)^2)/(1+(-log(Mp1/2-1)/pi)^2))
Tp1=3.98e-3;
wn1=pi/(Tp1*(sqrt(1-zi1^2)))
%Segundo Orden 2
Mp2=2.02;
zi2=sqrt(((-log(Mp2/2-1)/pi)^2)/(1+(-log(Mp2/2-1)/pi)^2));
Tp2=1.5e-3;
wn2=pi/(Tp2*(sqrt(1-zi2^2)));
save('Datos.mat','T','zi1','wn1','zi2','wn2');
sys21=tf(wn1^2,[1 2*wn1*zi1 wn1^2]);
sys22=tf(wn2^2,[1 2*wn2*zi2 wn2^2])
sys1=tf(1,[460e-6 1])
sys3=sys1*sys21;
sys5=sys1*sys22*sys21;
