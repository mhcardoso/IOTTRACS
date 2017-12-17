%%%%%%%%Energy Simulations
PT = 1; %normalization of the energy
Tp = 0.2;
Eo = PT*Tp;
p = 0.1;
%Etdma = N*Eo;

%Erd = C*10*log(N)*Eo;

%Err = p*N*Eo;
fplot(@(x) 10*log(x), [1000 4000]);
hold on;
fplot(@(x) x, [1000 4000]);
hold on;
fplot(@(x) p*x, [1000 4000]);


