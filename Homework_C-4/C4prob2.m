clc;
clear;
close all;

I  = 0.5;
Kp = 6;
Ki = 4;
Kd = 3;

G = tf(1, [I 0 0]); 
C = tf([Kd Kp Ki], [1 0]); 
L = C*G;                         

figure
rlocus(L); grid on
title('Root locus, commanded input')

figure
rlocus(L); grid on
title('Root locus, disturbance input')