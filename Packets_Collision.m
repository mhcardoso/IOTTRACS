%function [sumofcol sent collisions]= Packets_Collision(p)
function sumofcol = Packets_Collision(p, Ns, T, Tp)
%%%------------- INPUT -----------------
%%% p is the probability of a sensor deciding to send his measurement
%%% Ns is the total number of sensors doing measurements
%%% T is the time of coeherence, aka the time of the full frame
%%% Tp is the time required to send a packet
%%% ----------- OUTPUT -----------------
%%% sumofcol is the number of collisions that happened with the above
%%% parameters
%%%%%%%%%%%%%%%%%%%%%Random Access (R/R)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Time of frame and slot
%T = 120;
%Tp = 0.2;

%Number of Sensors is still Ns
%Ns = 1000;

%Probability is still p
%p = 0.3;

probability_of_sending = zeros(1, Ns);
time_of_sending = zeros(1, Ns);

for i = 1:Ns
    probability_of_sending(i) = binornd(1, p);
    time_of_sending(i) = round(unifrnd(0,T - Tp), 1); %round to the nearest decimal point
end

for i = 1:Ns
   time_of_sending(i) = time_of_sending(i) * probability_of_sending(i); 
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ordered_time = sort(time_of_sending);
non_zero_time = ordered_time(ordered_time~=0);
Ns = length(non_zero_time);
collided = zeros(1, Ns);

for i = 2:1:Ns
    if((non_zero_time(i-1) <= non_zero_time(i)) && (non_zero_time(i) <= non_zero_time(i-1)+0.2))
        collided(i) = 1;
        collided(i-1) = 1;
    end
end

%sent = non_zero_time;
sumofcol = Ns - sum(collided);
%sum(collided)/Ns;
%collisions = collided;

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%