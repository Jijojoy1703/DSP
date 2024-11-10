clc;
clear all;
close all;

% Define filter specifications
wcl = 0.25 * pi;   % Lower cutoff frequency in radians
wc2 = 0.75 * pi;   % Upper cutoff frequency in radians
N = 50;            % Filter length (order + 1)
alpha = (N - 1) / 2;  % Midpoint of filter for symmetry
n = 0:1:N-1;       % Sample index for impulse response

% Calculate the ideal bandpass filter impulse response
hd = (sin(wcl * (n - alpha + eps)) - sin(wc2 * (n - alpha + eps))) ./ (pi * (n - alpha + eps));

% Define frequency range for plotting
w = 0:0.01:pi; 

% Bandpass Filter using Hamming Window
w1 = hamming(N);       % Generate Hamming window
hn = hd .* w1';        % Apply window to ideal impulse response
h1 = freqz(hn, 1, w);  % Frequency response of Hamming windowed filter

subplot(4, 2, 1);
plot(w / pi, 10 * log10(abs(h1)));
title('BPF using Hamming window');
xlabel('Normalized Frequency');
ylabel('Magnitude (dB)');

% Bandpass Filter using Hanning Window
w2 = hanning(N);       % Generate Hanning window
hn = hd .* w2';        % Apply window to ideal impulse response
h2 = freqz(hn, 1, w);  % Frequency response of Hanning windowed filter

subplot(4, 2, 3);
plot(w / pi, 10 * log10(abs(h2)));
title('BPF using Hanning window');
xlabel('Normalized Frequency');
ylabel('Magnitude (dB)');

% Bandpass Filter using Rectangular Window
w3 = boxcar(N);        % Generate Rectangular window
hn = hd .* w3';        % Apply window to ideal impulse response
h3 = freqz(hn, 1, w);  % Frequency response of Rectangular windowed filter

subplot(4, 2, 5);
plot(w / pi, 10 * log10(abs(h3)));
title('BPF using Rectangular window');
xlabel('Normalized Frequency');
ylabel('Magnitude (dB)');

% Bandpass Filter using Triangular (Bartlett) Window
w4 = bartlett(N);      % Generate Triangular window
hn = hd .* w4';        % Apply window to ideal impulse response
h4 = freqz(hn, 1, w);  % Frequency response of Triangular windowed filter

subplot(4, 2, 7);
plot(w / pi, 10 * log10(abs(h4)));
title('BPF using Triangular window');
xlabel('Normalized Frequency');
ylabel('Magnitude (dB)');

% Plotting Window Sequences
% Hamming Window Sequence
subplot(4, 2, 2);
stem(w1);
title('Hamming Window Sequence');
xlabel('Number of Samples');
ylabel('Amplitude');

% Hanning Window Sequence
subplot(4, 2, 4);
stem(w2);
title('Hanning Window Sequence');
xlabel('Number of Samples');
ylabel('Amplitude');

% Rectangular Window Sequence
subplot(4, 2, 6);
stem(w3);
title('Rectangular Window Sequence');
xlabel('Number of Samples');
ylabel('Amplitude');

% Triangular Window Sequence
subplot(4, 2, 8);
stem(w4);
title('Triangular Window Sequence');
xlabel('Number of Samples');
ylabel('Amplitude');