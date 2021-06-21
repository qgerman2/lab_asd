clc;
clear all;
set(0,'defaultAxesFontName', 'times')
set(0,'defaultTextFontName', 'times')

%%NO AMORTIGUADAS
[t, accel, titulo] = VibsLibresNoAmort;
ind = interp1(t,1:length(t), 3,'nearest');
t = t(1:ind);
accel = accel(1:ind);

[peaks, index] = findpeaks(accel, 'MinPeakHeight', 0.002, 'MinPeakDistance', 100);
for i = 1:size(peaks,1)-1
    delta(i) = log(peaks(i)/peaks(i+1));
end
f1 = figure(1);
plot(1:1:size(peaks,1)-1, delta, 'o', [1, size(delta, 2)], [mean(delta), mean(delta)],'-')
mean(delta);
grid on
xlim([1, size(delta, 2)]);
xlabel("Ciclo");
ylabel("Decremento logarítmico");
xticks(1:1:size(delta, 2));
set(f1, 'Position',  [100, 100, 800, 250])
saveas(f1, "2 - NO amortiguadas decremento logaritmico.svg");

delta = mean(delta)
syms x
eq = delta == 2 * pi * x / sqrt(1 - x^2);
xi = vpasolve(eq, x)

%%SI AMORTIGUADAS
[t, accel, titulo] = VibsLibresAmort;
ind = interp1(t,1:length(t), 3,'nearest');
t = t(1:ind);
accel = accel(1:ind);

[peaks, index] = findpeaks(accel, 'MinPeakHeight', 0.002, 'MinPeakDistance', 100);
for i = 1:size(peaks,1)-1
    delta(i) = log(peaks(i)/peaks(i+1));
end
f2 = figure(2);
plot(1:1:size(peaks,1)-1, delta, 'o', [1, size(delta, 2)], [mean(delta), mean(delta)],'-')
mean(delta);
grid on
xlim([1, size(delta, 2)]);
xlabel("Ciclo");
ylabel("Decremento logarítmico");
xticks(1:1:size(delta, 2));
set(f2, 'Position',  [100, 100, 800, 250])
saveas(f2, "2 - SI amortiguadas decremento logaritmico.svg");

delta = mean(delta)
syms x
eq = delta == 2 * pi * x / sqrt(1 - x^2);
xi = vpasolve(eq, x)