alpha = 40;
beta = 25;


R1 = [1, 0, 0;
      0, cosd(alpha), sind(alpha);
      0, -sind(alpha), cosd(alpha)];
    
R2 = [cosd(beta), 0, -sind(beta);
      0, 1, 0;
      sind(beta), 0, cosd(beta)];

Q = R2 * R1;
disp('Q Matrix for order 2 1:');
disp(Q);