clear; 
clc; 
close all;

% G3
num3 = [1 2];
den3 = [1 5 10 10 5 2];
sys3 = tf(num3, den3);

% G4
num4 = [1 0.5];
den4 = [1 5 10 10 5 0.5];
sys4 = tf(num4, den4);


figure
impulse(sys3)
grid on
title('G3 impulse response')

figure
impulse(sys4)
grid on
title('G4 impulse response')


figure
step(sys3)
grid on
title('G3 step response')

figure
step(sys4)
grid on
title('G4 step response')


stepinfo(sys3, 'RiseTimeLimits', [0.1 0.9], 'SettlingTimeThreshold', 0.05)
stepinfo(sys4, 'RiseTimeLimits', [0.1 0.9], 'SettlingTimeThreshold', 0.05)