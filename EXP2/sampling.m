clc;
clear all;
close all;

% 1. Continuous Signal
subplot(2,2,1);
t = 0:0.01:1;
f = 10;
y = sin(2*pi*f*t);
plot(t, y, 'LineWidth', 1.5);
grid on;
xlabel("Time (s)");
ylabel("Amplitude");
title("Continuous Signal");

% 2. Under Sampled Signal
subplot(2,2,2);
fs = 0.5 * f; % Undersampled
t1 = 0:1/fs:1;
y1 = sin(2*pi*f*t1);
stem(t1, y1, 'filled');
hold on;
plot(t1, y1, 'LineWidth', 1.5);
grid on;
xlabel("Time (s)");
ylabel("Amplitude");
title("Under Sampled Signal");

% 3. Nyquist Sampled Signal
subplot(2,2,3);
fs2 = 3 * f; % Nyquist sampled
t3 = 0:1/fs2:1;
y2 = sin(2*pi*f*t3);
stem(t3, y2, 'filled');
hold on;
plot(t3, y2, 'LineWidth', 1.5);
grid on;
xlabel("Time (s)");
ylabel("Amplitude");
legend("Discrete", "Continuous");
title("Nyquist Sampled Signal");

% 4. Over Sampled Signal
subplot(2,2,4);
fs3 = 100 * f; % Oversampled
t4 = 0:1/fs3:1;
y3 = sin(2*pi*f*t4);
stem(t4, y3, 'filled');
hold on;
plot(t4, y3, 'LineWidth', 1.5);
grid on;
xlabel("Time (s)");
ylabel("Amplitude");
legend("Discrete", "Continuous");
title("Over Sampled Signal");
