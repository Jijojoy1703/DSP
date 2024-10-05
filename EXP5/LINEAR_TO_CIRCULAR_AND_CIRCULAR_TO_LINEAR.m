%1. Linear Convolution using Circular Convolution
clc;
clear all;
close all;
x = [1 2 3 4];
h = [1 1 1 ];
l = length(x);
m = length(h);
k = l+m-1;
x = [x zeros(1,k-l)];
h = [h zeros(1,k-m)];
X_k = fft(x);
H_k = fft(h);
Y_k = X_k.*H_k;
y = ifft(Y_k);
disp("Linear Convolution using Circular Convolution :");
disp(y);
%2.Circular convolution using Linear Convolution
clc;
close all;
clear all;
x = [1 2 3 4];
h = [1 1 1 ];
l = length(x);
m = length(h);
lc = max(l,m);
ll= l+m-1;
y = conv(x,h);
for i=1:ll-lc
y(i) = y(i) + y(lc+i);
end
for i=1:lc
y1(i) = y(i);
end
disp("Circular convolution using Linear Convolution:")
disp(y1);