1. Overlap Add 
clc; 
clear all; 
close all; 
x = input('Enter the input sequence x : '); 
h = input('Enter the impulse response h : '); 
L = length(h); % Length of impulse response 
N = length(x); 
M = length(h); 
x_padded = [x, zeros(1, L - 1)]; 
y = zeros(1, N + M +1); 
num_sections = (N + L - 1) / L; % Calculate number of sections 
for n = 0:num_sections-1 
start_idx = n * L + 1; 
end_idx = start_idx + L - 1; 
x_section = x_padded(start_idx:min(end_idx, end)); 
conv_result = conv(x_section, h); 
y(start_idx:start_idx + length(conv_result) - 1) 
=y(start_idx:start_idx + length(conv_result) - 1) + conv_result; 
end 
y = y(1:N + M - 1); 
y_builtin = conv(x, h); 
% Display results 
disp('Overlap-add convolution result:'); 
disp(y); 
disp('Built-in convolution result:'); 
disp(y_builtin); 
figure; 
subplot(2, 1, 1); 
stem(y, 'filled'); 
title('Overlap-add Convolution Result'); 
grid on; 
subplot(2, 1, 2); 
stem(y_builtin, 'filled'); 
title('Built-in Convolution Result'); 
grid on; 
 
2. Overlap Save 
clc; 
clear all; 
close all; 
x = input("Enter 1st sequence: "); 
h = input("Enter 2nd sequence: "); 
N = input("Fragmented block size: "); 
y = ovrlsav(x, h, N); 
disp("Using Overlap and Save method"); 
disp(y); 
disp("Verification"); 
disp(cconv(x,h,length(x)+length(h)-1)); 
function y = ovrlsav(x, h, N) 
if (N < length(h)) 
error("N must be greater than the length of h"); 
 
end 
Nx = length(x); % Length of input sequence x 
M = length(h); % Length of filter sequence h 
M1 = M - 1; % Length of overlap 
L = N - M1; % Length of non-overlapping part 
x = [zeros(1, M1), x, zeros(1, N-1)]; 
h = [h, zeros(1, N - M)]; 
K = floor((Nx + M1 - 1) / L); 
Y = zeros(K + 1, N); 
 
for k = 0:K 
xk = x(k*L + 1 : k*L + N);  
Y(k+1, :) = cconv(xk, h, N);  
end