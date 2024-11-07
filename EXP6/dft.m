clc; 
clear all; 
close all; 
x=input("enter sequence:"); 
N=input("enter the N point:"); 
l=length(x); 
x=[x zeros(1,N-l)]; 
X=zeros(1,N); 
for k=0:N-1 
for n=0:N-1 
X(k+1)=X(k+1)+x(n+1)*exp(-1j*2*pi*n*k/N); 
 
end 
end 
 
disp('X'); 
disp(X); 
disp('round(X)'); 
disp(round(X)); 
%verification 
disp('fft'); 
disp(fft(x)); 
 
 
k=0:N-1; 
magX=abs(X); 
phaseX=angle(X); 
subplot(2,1,1); 
stem(k,magX); 
title("Magnitude Plot"); 
hold on; 
plot(k,magX); 
subplot(2,1,2); 
stem(k,phaseX); 
hold on; 
title("Phase Plot"); 
plot(k,phaseX); 