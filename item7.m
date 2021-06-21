clc;
clear all;

m0 = 0.027/2; %kg
r0 = 0.0387; %m
L1 = 0.36; %m
h = 0.072; %m

syms rpm
w = rpm * 2 * pi / 60;
feq = 2*m0*r0*w^2*sqrt(L1^2+h^2);

vel = [260, 300, 325, 380, 420, 515, 610];
A0_real = [0.0195, 0.0810, 0.3656, 0.1386, 0.1095, 0.1068, 0.1260];
for i = 1:1:7
    acelerancia(i) = double(A0_real(i) / subs(feq, vel(i)));
    feqq(i) = double(subs(feq, vel(i)));
end

plot(vel, acelerancia, "-", vel, acelerancia, "o", "Color", "b")
grid on
xlim([260, 610]);
ylim([0, 0.9])
yticks(0:0.1:0.9);
xticks(vel);
xlabel("Velocidad del motor [CPM]");
ylabel("Acelerancia [A/F]");
set(gcf, 'Position',  [100, 100, 800, 250])
saveas(gcf, strcat('7 - FRF.svg'));

[vel; A0_real; feqq; acelerancia]
