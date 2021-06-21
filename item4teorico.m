clc;
clear all;
set(0,'defaultAxesFontName', 'times')
set(0,'defaultTextFontName', 'times')

L1 = 0.36;
L2 = 0.66;
L3 = 0.725;
k = 3819;
m0 = 0.027/2;
r0 = 0.0387;
h = 0.072;
xi = 0.01;
k_eq = k * L2^2 / L3;
w_n = 33.4847;


syms rpm

w = rpm * 2 * pi / 60;
f_eq = 2*m0*r0*w^2*sqrt(L1^2+h^2);
X0 = (f_eq / k_eq) / sqrt( (1-(w/w_n)^2)^2 + (2*xi*w/w_n)^2 ); 
Phi = atan2(2 * xi * w/w_n, 1-(w/w_n)^2) * 180 / pi;
A0 = X0 * w^2 / 9.81;
%encontrar velocidad de resonancia
assume(rpm>300);
S = solve(diff(A0, rpm) == 0, rpm);
vres = double(S(1))

f1 = figure(1);
fplot(A0, [0, 650])
hold on
fplot(A0, [vres, vres], "o")
grid on
ylim([0, 1.25]);
yticks(0:0.25:1.25);
xticks(0:50:650);
xlabel("Velocidad del motor [CPM]");
ylabel("Amplitud de aceleración [g]");
set(f1, 'Position',  [100, 100, 800, 250])
saveas(f1, strcat('4 teorico - Amplitud.svg'));

f2 = figure(2);
fplot(Phi, [0, 650])
grid on
xlabel("Velocidad del motor [CPM]");
ylabel("Desfase [grados]");
yticks(0:45:180);
xticks(0:50:650);
set(f2, 'Position',  [100, 100, 800, 250])
saveas(f2, strcat('4 teorico - Desfase.svg'));