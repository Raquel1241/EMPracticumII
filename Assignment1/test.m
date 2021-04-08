load('group-05.mat')
f = 9.1e9;

% 1.1 calculate phase velocity
min = session2.task_1_1.positions_of_min; % positions of minima
d_min1 = min(2)-min(1); % first estimate  
d_min2 = min(3)-min(2); % second estimate
d_min = mean([d_min1, d_min2]); % mean of estimates, lambda/2

v_p = 2*d_min*f; % phase velocity

% 2.2
x = session2.task_1_2.position;
y = session2.task_1_2.voltage;
deg = 2; % voltage = constant/R^deg
plot(x, y, 'o')
title(sprintf("RX position vs. RX voltage, x = %d", deg))
xlabel("RX position [cm]")
ylabel("RX Voltage [V]")

% curve fitting
c = y(2).*x(2).^deg; % detemine constant
curve = c./(x.^deg); % fit curve
hold on
plot(x, curve, 'r')
legend('Measured data','Fitted curve')
hold off
