clc;
clear all;
set(0,'defaultAxesFontName', 'times')
set(0,'defaultTextFontName', 'times')

%experimental
[t, accel, titulo] = VibsLibresAmort;
ind = interp1(t,1:length(t), 3,'nearest');
tt = t(1:ind);
accel = accel(1:ind);

%modelo
xi = 0.02836;
w_n = 33.4830;
w_d = w_n * sqrt(1 - xi^2);

syms t x_0
B = x_0;
A = (B * xi * w_n)/(w_d);
y = exp(-xi*w_n*t) * (A*sin(w_d*t)+B*cos(w_d*t));
accel_model = diff(y, t, 2) / 9.81;
S = vpasolve([diff(y, t, 2) / 9.81 == accel(1), t==0], [t, x_0]);
S.x_0

yy = exp(-xi*w_n*t) * ((S.x_0*xi*w_n/w_d)*sin(w_d*t)+S.x_0*cos(w_d*t));
aaccel_model = diff(yy, t, 2) / 9.81;

plot(tt, accel)
xlim([0, tt(end)]);
ylim([min(accel), max(accel)]);
hold on
fplot(aaccel_model, [0, 3])
grid on
xlim([0, tt(end)]);
ylim([min(accel), max(accel)]);
xlabel("Tiempo [s]")
ylabel("Aceleración [g]")
set(gcf, 'Position',  [100, 100, 800, 250])
legend("Experimental","Modelo");
saveas(gcf, strcat('3 - Comparación.svg'));