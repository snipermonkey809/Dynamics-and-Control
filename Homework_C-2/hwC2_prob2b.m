clear; clc; close all;

% poles of the system: -1/6, -1, -2, -3
den = conv(conv([1 1/6],[1 1]), conv([1 2],[1 3]));

[r, p] = residue(1, den);
disp('part a: poles and coefficients')
disp([p r])

%part b
den_b = conv(den, [1 0 1]);
[r_b, p_b] = residue(1, den_b);
disp('part b: poles and coefficients')
disp([p_b r_b])

% pull out the complex pair at s = j and turn it into cos and sin
E = r_b(abs(p_b - 1j) < 1e-6);
cos_coef =  2*real(E);
sin_coef = -2*imag(E);
fprintf('cos(t) coefficient: %.6f\n', cos_coef)
fprintf('sin(t) coefficient: %.6f\n', sin_coef)


t = linspace(0, 20, 1000);

ra_hand = (216/935)*exp(-t/6) - (3/5)*exp(-t) + (6/11)*exp(-2*t) - (3/17)*exp(-3*t);

rb_hand = (7776/34595)*exp(-t/6) - (3/10)*exp(-t) + (6/55)*exp(-2*t) ...
        - (3/170)*exp(-3*t) - (3/185)*cos(t) - (18/185)*sin(t);

% r(t) from the residues
ra = real(sum(r   .* exp(p   * t), 1));
rb = real(sum(r_b .* exp(p_b * t), 1));

fprintf('max difference part a: %.2e\n', max(abs(ra - ra_hand)))
fprintf('max difference part b: %.2e\n', max(abs(rb - rb_hand)))


subplot(2,1,1)
plot(t, ra_hand); grid on
xlabel('t'); ylabel('r(t)'); title('part a')

subplot(2,1,2)
plot(t, rb_hand); grid on
xlabel('t'); ylabel('r(t)'); title('part b')