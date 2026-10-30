clear; 
clc;

v3 = -[1 1 1 1];
w1 = [-1 -1  1  1];
w2 = [ 1 -1 -1  1];
w3 = [-1  1 -1  1];

rows  = [v3; w1; w2; w3];
label = {'v3','w1','w2','w3'};

type = [  1  0  0  0;     % part a
          1  0  0  1;     % part b
          0  1  0  1;     % part c
          1  0  1  1];    % part d

letters = 'abcd';

for p = 1:4
    t = type(p,:);
    fprintf('\n=== part %s ===\n', letters(p))

    for i = 1:3
        for j = i+1:4

            show([label{i} ' + ' label{j}], rows(i,:) + rows(j,:), t(i) | t(j))

            if t(j) == 0
                show([label{i} ' - ' label{j}], rows(i,:) - rows(j,:), t(i))
            end
            if t(i) == 0 && t(j) == 1
                show([label{j} ' - ' label{i}], rows(j,:) - rows(i,:), t(j))
            end
        end
    end
end


F = [-1  0 -1 -1;      % dfa
     -1  0  0 -1;      % dfb
     -1 -1  0 -2;      % dfc
     -1  0  1  0];     % dfd

R = rows * F;       
disp('accelerations from the boxed answers (columns = parts a-d):')
disp(R)

for p = 1:4
    if all(sign(R(:,p)) == type(p,:)')
        fprintf('part %s: boxed answer works\n', letters(p))
    else
        fprintf('part %s: boxed answer does NOT work\n', letters(p))
    end
end


function show(lab, c, t)
    names = {'dfa','dfb','dfc','dfd'};
    c = c / min(abs(c(c ~= 0)));    
    left = ''; right = '';
    for k = 1:4
        if c(k) > 0, left  = [left  ' + ' names{k}]; end
        if c(k) < 0, right = [right ' + ' names{k}]; end
    end
    if isempty(left),  left  = '0'; else, left  = left(4:end);  end
    if isempty(right), right = '0'; else, right = right(4:end); end
    if t, rel = '>'; else, rel = '='; end
    fprintf('%-8s ->  %s %s %s\n', lab, left, rel, right)
end