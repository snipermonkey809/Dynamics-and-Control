%% Problem 4 - entire solution in code
clear; clc;

% Mixing matrix: rows = [v3dot; w1dot; w2dot; w3dot], cols = [fa fb fc fd]
M = [-1 -1 -1 -1;
     -1 -1  1  1;
      1 -1 -1  1;
     -1  1 -1  1];

disp('M*M'' (should be 4*I, so inv(M) = M''/4):'); disp(M*M')


syms v w1 w2 w3 real          % v = v3dot, w1 = w1dot, ...
fsol = simplify(M \ [v; w1; w2; w3]);     % [fa; fb; fc; fd]
names = {'fa','fb','fc','fd'};
disp('General solution:')
for i = 1:4, fprintf('d%s = ', names{i}); disp(fsol(i)); end

% a) v>0, w1=w2=w3=0
% b) v>0, w3>0, w1=w2=0
% c) w3>0, w1>0, v=0, w2=0
% d) v>0, w3>0, w2>0, w1=0
cases = {'a', {w1,w2,w3}, [0 0 0];
         'b', {w1,w2},    [0 0];
         'c', {v,w2},     [0 0];
         'd', {w1},       0};

for k = 1:size(cases,1)
    f = subs(fsol, [cases{k,2}{:}], cases{k,3});
    fprintf('\n===== Part %s =====\n', cases{k,1});
    for i = 1:4, fprintf('d%s = ', names{i}); disp(simplify(f(i))); end
    for i = 1:3
        for j = i+1:4
            fprintf('d%s - d%s = ', names{i}, names{j});
            disp(simplify(f(i) - f(j)));       % 0 -> equal; else sign shows ordering
        end
    end
    fprintf('Sum of all four = '); disp(simplify(sum(f)));   % = -2*v3dot
end

N = 2000; tol = 1e-9; ok = true(4,1);
for n = 1:N
    r = rand(3,1) + 0.1;                 % random positive values
    % a)
    f = M \ [r(1);0;0;0];
    ok(1) = ok(1) && all(abs(f - f(1)) < tol) && f(1) < 0;
    % b)
    f = M \ [r(1);0;0;r(3)];
    ok(2) = ok(2) && abs(f(1)-f(3))<tol && abs(f(2)-f(4))<tol && f(2)>f(1) && f(1)<0;
    % c)
    f = M \ [0;r(2);0;r(3)];
    ok(3) = ok(3) && abs(f(1)+f(4))<tol && abs(f(2)+f(3))<tol && f(1)<0 && f(4)>0;
    % d)
    f = M \ [r(1);0;r(2);r(3)];
    ok(4) = ok(4) && f(3)<f(1) && f(3)<f(2) && f(1)<f(4) && f(2)<f(4) ...
                  && abs((f(1)+f(2)) - (f(3)+f(4)))<tol && (f(1)+f(2))<0;
end
fprintf('\nRelationships hold for %d random cases?  a:%d b:%d c:%d d:%d\n', N, ok);

ex = {'a',[1;0;0;0]; 'b',[1;0;0;1]; 'c',[0;1;0;1]; 'd',[1;0;1;1]};
for k = 1:4
    fprintf('\nExample, part %s:\n', ex{k,1});
    describe(M \ ex{k,2});
end

function describe(f)
    nm = 'abcd'; tol = 1e-9;
    for i = 1:4, fprintf('  df%s = %+.3f\n', nm(i), f(i)); end
    for i = 1:3
        for j = i+1:4
            d = f(i) - f(j);
            if abs(d) < tol, rel = '='; elseif d < 0, rel = '<'; else, rel = '>'; end
            fprintf('  df%s %s df%s\n', nm(i), rel, nm(j));
        end
    end
end