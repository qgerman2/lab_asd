M = 5.467; %kg
mb = 1.92; %kg
mr = 0.1392; %kg
ms = 0.4391; %kg
k = 3819; %N/m
m0 = 0.027/2; %kg
r0 = 0.0387; %m
L1 = 0.36; %m
L2 = 0.66; %m
L3 = 0.725; %m
L4 = 0.543; %m
b = 0.0127; %m
h = 0.072; %m
ma = 0.397; %kg

I = mb*L3^2/3 + mb*b^2/12 + ms*L3^2 + M*(L1^2 + h^2) + mr*L2^2 + m0*(L1^2 + (h + r0)^2) + ma * L4^2
meq = I/L3;
keq = k * L2^2 / L3;
wn = sqrt(keq/ meq)


