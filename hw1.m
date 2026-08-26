theta = 40;

R1 = [1, 0, 0;
      0, cosd(theta), sind(theta);
      0, -sind(theta), cosd(theta)];
    
R2 = [cosd(theta), 0, -sind(theta);
      0, 1, 0;
      sind(theta), 0, cosd(theta)];

R3 = [cosd(theta), sind(theta), 0;
      -sind(theta), cosd(theta), 0;
      0, 0, 1];

Q = R3 * R2 * R1;

disp(Q);
