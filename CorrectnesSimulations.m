%sensor_vector = linspace(100, 10000, 10);
coherence_vector = linspace(20, 1000, 10);
probability_vector = linspace(0, 1, 100);

figure;
title('Relation between probability of sensing and number of collisions');
xlabel('Probability of sensing, p');
ylabel('Average number of collision-free packets');
hold on;
%for f = 1:1:length(sensor_vector)
%   result_vector = Collision_Vector_Maker(sensor_vector(f), 120, 0.2, 100, 100);
%   plot(probability_vector, result_vector);
%end
result_vector = Collision_Vector_Maker(1000, coherence_vector(1), 0.2, 100, 100);
plot(probability_vector, result_vector);

