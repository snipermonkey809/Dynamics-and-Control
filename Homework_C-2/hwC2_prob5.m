clear; clc;

K0 = [4 6 4 1]; %nominal gains K1..K4, (s+1)^4

disp('nominal gains: roots of (s+1)^4')
disp(roots([1 K0]))

for i = 1:4
    for d = [-0.5 0.5]
        K = K0;
        K(i) = K(i) + d; 
        r = roots([1 K]);
        fprintf('K%d = %.1f  (K%d %+.1f)\n', i, K(i), i, d)
        disp(r)
    end
end