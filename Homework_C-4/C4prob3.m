clc;
clear;
close all;

G = tf([1 0.25], [1 4 6 4 1 0.25]);  
w = logspace(-2, 1, 1000);         

figure
bode(G, w); grid on    

%part e
figure
rlocus(G); grid on 