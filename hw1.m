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

lambda = 1;

u = (Q - lambda*eye(3));
disp(u);

u_hat = [];

u_x = ;
u_y = ;
u_z = ;

u_tilda = [0, -u_z, u_y;
            u_z, 0, -u_x;
            -u_y, u_x, 0];

disp(u_tilda);