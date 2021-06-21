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
f1 = figure(1);
plot(t, accel)
grid on
xlim([0, t(end)]);
ylim([min(accel), max(accel)]);
xlabel("Tiempo [s]")
ylabel("Aceleración [g]")
set(f1, 'Position',  [100, 100, 800, 250])
saveas(f1, "1 - NO amortiguadas aceleración - tiempo.svg");

for i = 1:1:size(index, 1) - 1
   period_raw(i) = (t(index(i+1)) - t(index(i))) * 1000;
end
f2 = figure(2);
plot(1:1:size(period_raw, 2), period_raw, 'o', [1, size(period_raw, 2)], [mean(period_raw), mean(period_raw)],'-')
mean(period_raw)
grid on
xlim([1, size(period_raw, 2)]);
xlabel("Ciclo");
ylabel("Tiempo [ms]");
xticks(1:1:size(period_raw, 2));
set(f2, 'Position',  [100, 100, 800, 250])
saveas(f2, "1 - NO amortiguadas tiempo de cada ciclo.svg");


%%SI AMORTIGUADAS
[t, accel, titulo] = VibsLibresAmort;
ind = interp1(t,1:length(t), 3,'nearest');
t = t(1:ind);
accel = accel(1:ind);

[peaks, index] = findpeaks(accel, 'MinPeakHeight', 0.002, 'MinPeakDistance', 100);
f3 = figure(3);
plot(t, accel)
grid on
xlim([0, t(end)]);
ylim([min(accel), max(accel)]);
xlabel("Tiempo [s]")
ylabel("Aceleración [g]")
set(f3, 'Position',  [100, 100, 800, 250])
saveas(f3, "1 - SI amortiguadas aceleración - tiempo.svg");

for i = 1:1:size(index, 1) - 1
   period_raw(i) = (t(index(i+1)) - t(index(i))) * 1000;
end

f4 = figure(4);
plot(1:1:size(period_raw, 2), period_raw, 'o', [1, size(period_raw, 2)], [mean(period_raw), mean(period_raw)],'-')
mean(period_raw)
grid on
xlim([1, size(period_raw, 2)]);
xlabel("Ciclo");
ylabel("Tiempo [ms]");
xticks(1:1:size(period_raw, 2));
set(f4, 'Position',  [100, 100, 800, 250])
saveas(f4, "1 - SI amortiguadas tiempo de cada ciclo.svg");


