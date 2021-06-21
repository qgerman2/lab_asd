clc;
clear all;

%experimental
[t1, accel1] = VibsForzadasNoAmort_Resonancia02;
ind1 = interp1(t1,1:length(t1), 3,'nearest');
t1 = t1(1:ind1);
accel1 = accel1(1:ind1);

[t2, accel2] = VibsForzadasAmort_Resonancia;

plot(t1, accel1, t2, accel2)
xlim([0, 3]);
xlabel("Tiempo [s]")
ylabel("Aceleración [g]")
set(gcf, 'Position',  [100, 100, 800, 250])
legend("Sin amortiguador","Con amortiguador pistón");
saveas(gcf, strcat('5 - Resonancia.svg'));