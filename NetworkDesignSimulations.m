%%%%%%%%%%%%%%%% Network Design Simulation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%Poisson process of no collision
M = 150;
Nsim = 500;
p = 0.1;
N = 1000;
T = 120;
Tp = 0.2;

probability_no_collision = exp(-2*(N*p*Tp)/(T-Tp));

q = p*probability_no_collision;

Y = binopdf(1:1:M, N, q);

k = 0;
kk = 0;

for j = 1:1:Nsim
    kk = Packets_Collision(p, N, T, Tp);
    k = k + kk;
    a(j) = kk;
end

qest = (k*(1/Nsim))/N;

YY = binopdf(1:1:M, N, qest);

figure;
plot(1:1:M, Y, 'r.');
hold on;
plot(1:M, YY, 'b-');
title('Comparison between theoretical and estimated probability of collision');
legend('Theoretical q', 'Estimated q');
xlabel('Number of successful receptions');
ylabel('Probability');

Z = 1 - binocdf(1:1:100, N, q);
ZZ = 1 - binocdf(1:1:100, N, qest);

figure;
plot(1:1:100, Z, 'r.');
hold on;
plot(1:1:100, ZZ, 'b-');
title('Comparison between cumulative probabilities of collision');
legend('Theoretical q', 'Estimated q');
xlabel('Successful reception of packet(s)');
ylabel('Probability of number of receptions');


%%%%%%%%%%simulate intZZ = 1-binocdf(1:1:100, 1000, qs);
%%%%%%%%%%see what is the probability at intZZ = 4;
%%%%%%%%%%plot that.

%intZZ = zeros(1, length(0:0.02:0.1));

%i = 1;

%for qs = 0:0.02:0.1
%   ZZ = 1 - binocdf(1:1:100, 1000, qs);
%   intZZ(i) = ZZ(10);
%   i = i+1;
%end

%figure;
%plot(0:0.02:0.1, intZZ, 'b-');
%title('Relation between probability of collision and probability of sensing');
%ylabel('Probability of Ns packets');
%xlabel('Probability of collision, qs');