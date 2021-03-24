load('group-05.mat')
f = 9.1e9;

plot(session2.task_1_2.position,session2.task_1_2.voltage)
title("Grid position vs. receiver voltage")
xlabel("Grid position [cm]")
ylabel("Voltage receiver [V]")

% calculate phase velocity
d_min1 = session2.task_1_1.positions_of_min(2)-session2.task_1_1.positions_of_min(1);  
d_min2 = session2.task_1_1.positions_of_min(3)-session2.task_1_1.positions_of_min(2);
d_min = mean([d_min1, d_min2]); % lambda/2

v_p = 2*d_min*f; % phase velocity