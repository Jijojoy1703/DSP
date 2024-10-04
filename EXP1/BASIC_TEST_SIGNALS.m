clc;
clear all;
close all;

% 1. Unit Impulse Signal
subplot(3,3,1);
t = -5:1:5;
y = [zeros(1,5), 1, zeros(1,5)];
stem(t, y, 'filled');
xlabel("Time (s)");
ylabel("Amplitude");
title("Unit Impulse Signal");

% 2. Bipolar Square Wave
subplot(3,3,2);
t2 = 0:0.01:1;
f2 = 2; % Reduced frequency
y2 = square(2*pi*f2*t2);
stem(t2, y2, 'filled');
hold on;
plot(t2, y2, 'LineWidth', 1.5);
xlabel("Time (s)");
ylabel("Amplitude");
title("Bipolar Pulse Signal");
legend("Discrete", "Continuous");

% 3. Unipolar Square Wave
subplot(3,3,3);
t3 = 0:0.01:1;
y3 = abs(square(2*pi*f2*t3));
stem(t3, y3, 'filled');
hold on;
plot(t3, y3, 'LineWidth', 1.5);
xlabel("Time (s)");
ylabel("Amplitude");
title("Unipolar Pulse Signal");
legend("Discrete", "Continuous");

% 4. Unit Ramp Signal
subplot(3,3,4);
t4 = -5:1:5;
y4 = t4 .* (t4 >= 0);
stem(t4, y4, 'filled');
hold on;
plot(t4, y4, 'LineWidth', 1.5);
xlabel("Time (s)");
ylabel("Amplitude");
title("Unit Ramp Signal");
legend("Discrete", "Continuous");

% 5. Triangular Wave
subplot(3,3,5);
t5 = 0:0.025:1;
f5 = 5; % Increased frequency
y5 = sawtooth(2*pi*f5*t5, 0.5);
stem(t5, y5, 'filled');
hold on;
plot(t5, y5, 'LineWidth', 1.5);
xlabel("Time (s)");
ylabel("Amplitude");
title("Triangular Signal");
legend("Discrete", "Continuous");

% 6. Sine Wave
subplot(3,3,6);
t6 = 0:0.001:1;
f6 = 5; % Increased frequency
y6 = sin(2*pi*f6*t6);
stem(t6, y6, 'filled');
hold on;
plot(t6, y6, 'LineWidth', 1.5);
xlabel("Time (s)");
ylabel("Amplitude");
title("Sine Wave");
legend("Discrete", "Continuous");

% 7. Cosine Wave
subplot(3,3,7);
t7 = 0:0.001:1;
y7 = cos(2*pi*f6*t7);
stem(t7, y7, 'filled');
hold on;
plot(t7, y7, 'LineWidth', 1.5);
xlabel("Time (s)");
ylabel("Amplitude");
title("Cosine Wave");
legend("Discrete", "Continuous");

% 8. Exponential Decay Signal
subplot(3,3,8);
t8 = 0:0.1:5;
y8 = exp(-0.5*t8); % Decaying exponential
stem(t8, y8, 'filled');
hold on;
plot(t8, y8, 'LineWidth', 1.5);
xlabel("Time (s)");
ylabel("Amplitude");
title("Exponential Decay Signal");
legend("Discrete", "Continuous");

% 9. Unit Step Signal
subplot(3,3,9);
t9 = -5:1:5;
y9 = [zeros(1,5), ones(1,6)];
stem(t9, y9, 'filled');
xlabel("Time (s)");
ylabel("Amplitude");
title("Unit Step Signal");

% Adjust layout for better visibility
sgtitle('Signal Plots');
