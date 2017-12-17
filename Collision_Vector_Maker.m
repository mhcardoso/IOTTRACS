function return_vector = Collision_Vector_Maker(Nsensors, T, Tp, step, N_simulations)

%step = 100;
%%step is actually 1/step.

probability_vector = linspace(0, 1, step);


collision_vector = zeros(1, length(probability_vector));
collision_vectors = zeros(1, length(probability_vector));

%N_simulations = 100;

for f = 1:1:N_simulations
    for i = 1:1:length(probability_vector)
        j = probability_vector(i);
        collision_vector(i) = Packets_Collision(j, Nsensors, T, Tp);
    end
    collision_vectors = collision_vectors + collision_vector;
end

return_vector = collision_vectors/N_simulations;

%figure;
%plot(probability_vector, collision_vectors/N_simulations);
%title('Relation between probability of sensing and number of collisions');
%xlabel('Probability of sensing, p');
%ylabel('Average number of collision-free packets');

end