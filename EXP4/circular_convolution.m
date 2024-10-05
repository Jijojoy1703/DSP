%a. Using FFT and IFFT.
clc;
close all;
clear all;
x1 = [1 2 1 2];
x2 = [1 2 3 4];
X1_k = fft(x1);
X2_k = fft(x2);
Y1_k = X1_k.*X2_k;
y1 = ifft(Y1_k);
disp("Using FFT and IFFT:")
disp(y1);
%b. Using Concentric Circle Method.
clc;
close all;
clear all;
x = [1 2 1 2];
h = [1 2 3 4];
N = max(length(x),length(h));
y = zeros(1,N);
for n=1:N
h_s = circshift(h,n-1); %shifting h(n) by 1 unit
y(n) = sum(x.*h_s);
end
disp("Using Concentric Circle Method:")
disp(y);
%c. Using Matrix Method.
clc;
close all;
clear all;
x = [1 2 1 2];
h = [1 2 3 4];
N = max(length(x),length(h));
h_n = zeros(N,N);
for n=1:N
h_s = circshift(h,n-1);%shifting h(n) by 1 unit
h_n(:,n) = h_s;
end
y = h_n *x';
disp("Using Concentric Circle Method:")
disp(y');