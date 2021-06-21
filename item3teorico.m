clc;
clear all;
set(0,'defaultAxesFontName', 'times')
set(0,'defaultTextFontName', 'times')

x_0 = 0.005;
dx_0 = 0;
xi = 0.01;
w_n = 33.484;
w_d = w_n * sqrt(1 - xi^2);

B = x_0
A = (B * xi * w_n + dx_0)/(w_d)

syms t
y = exp(-xi*w_n*t) * (A*sin(w_d*t)+B*cos(w_d*t));
accel = diff(y, t, 2) / 9.81;

fplot(accel, [0, 3])
grid on
xlim([0, 3]);
ylim([-0.6, 0.6]);
xlabel("Tiempo [s]");
ylabel("Aceleración [g]");
yticks(-0.6:0.1:0.6);
set(gcf, 'Position',  [100, 100, 800, 250])
saveas(gcf, strcat('3 teorico - Vibraciones libres teoricas.svg'));