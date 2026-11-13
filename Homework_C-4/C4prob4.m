clc;
clear;
close all;

%% Part b, c and d

num = [1];
den = [1, 2, 2, 1];

G = tf(num, den);

figure
bode(G);

w = logspace(-2, 2);
M = 1 ./ sqrt(1 + w.^6);

figure
bodemag(G, w); hold on
semilogx(w, 20*log10(M), 'r--');
legend('Derived M(\omega)', 'MATLAB bode');

