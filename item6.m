clc;
clear all;
set(0,'defaultAxesFontName', 'times')
set(0,'defaultTextFontName', 'times')

%explicacion del metodo
f1 = figure(1);
[tt, aa] = VibsForzadasAmort_260CPM();
[peaks, i] = findpeaks(aa, 'MinPeakHeight', 0.015, 'MinPeakDistance', 100);
plot(tt, aa, "-", tt(i), peaks, "o");
grid on
xlabel("Tiempo [s]")
xticks(1:1:15);
ylabel("Aceleración [g]")
set(f1, 'Position',  [100, 100, 800, 250])
saveas(f1, strcat('6 - Explicacion 260CPM.svg'));
A(1) = mean(peaks);

%sacar los demas datos de la tabla
[tt, aa] = VibsForzadasAmort_300CPM();
peaks = findpeaks(aa, 'MinPeakHeight', 0.015, 'MinPeakDistance', 100);
A(2) = mean(peaks);

[tt, aa] = VibsForzadasAmort_Resonancia();
[peaks, i] = findpeaks(aa, 'MinPeakHeight', 0.015, 'MinPeakDistance', 100);
A(3) = mean(peaks);

[tt, aa] = VibsForzadasAmort_380CPM();
[peaks, i] = findpeaks(aa, 'MinPeakHeight', 0.015, 'MinPeakDistance', 100);
A(4) = mean(peaks);

[tt, aa] = VibsForzadasAmort_420CPM();
[peaks, i] = findpeaks(aa, 'MinPeakHeight', 0.015, 'MinPeakDistance', 100);
A(5) = mean(peaks);

[tt, aa] = VibsForzadasAmort_515CPM();
[peaks, i] = findpeaks(aa, 'MinPeakHeight', 0.015, 'MinPeakDistance', 100);
A(6) = mean(peaks);

[tt, aa] = VibsForzadasAmort_610CPM();
[peaks, i] = findpeaks(aa, 'MinPeakHeight', 0.015, 'MinPeakDistance', 100);
A(7) = mean(peaks);
Acpm = [260, 300, 325, 380, 420, 515, 610];
[A; Acpm]

L1 = 0.36;
L2 = 0.66;
L3 = 0.725;
k = 3819;
m0 = 0.027/2;
r0 = 0.0387;
h = 0.072;
xi = 0.02836;
k_eq = k * L2^2 / L3;
w_n = 33.4847;

%modelo
syms rpm
w = rpm * 2 * pi / 60;
f_eq = 2*m0*r0*w^2*sqrt(L1^2+h^2);
X0 = (f_eq / k_eq) / sqrt( (1-(w/w_n)^2)^2 + (2*xi*w/w_n)^2 ); 
Phi = atan2(2 * xi * w/w_n, 1-(w/w_n)^2) * 180 / pi;
A0 = X0 * w^2 / 9.81;

f2 = figure(2);
fplot(A0, [0, 650])
hold on
plot(Acpm, A);
grid on
ylim([0, 0.4]);
yticks(0:0.05:0.4);
xticks(0:50:650);
xlabel("Velocidad del motor [CPM]");
ylabel("Amplitud de aceleración [g]");
legend("Modelo", "Experimental");
set(f2, 'Position',  [100, 100, 800, 250])
saveas(f2, strcat('6 - Comparacion maxima amplitud.svg'));