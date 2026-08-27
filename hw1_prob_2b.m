alpha = 90;
beta = 30;

R1 = [1, 0, 0;
      0, cosd(beta), sind(beta);
      0, -sind(beta), cosd(beta)];

R3 = [cosd(alpha), sind(alpha), 0;
      -sind(alpha), cosd(alpha), 0;
      0, 0, 1];

Q = R1 * R3;
disp('Q Matrix for order 1 3:');
disp(Q);