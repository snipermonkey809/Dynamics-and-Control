
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

%order 3 2 1
Q = R3 * R2 * R1;
disp(Q);
[EVector,EValue] = eig(Q);

lamda = diag(EValue);
disp(lamda);

positive_e_phi = lamda(2);

%Eulers theorem is positive_e_phi = cos(phi) + i*sin(phi)
a = real(positive_e_phi);
b = imag(positive_e_phi);

phi_degree = atan2d(b, a);
disp(phi_degree);

%order 1 2 3
Q = R1 * R2 * R3;
disp(Q);
[EVector,EValue] = eig(Q);

lamda = diag(EValue);
disp(lamda);

positive_e_phi = lamda(1);

%Eulers theorem is positive_e_phi = cos(phi) + i*sin(phi)
a = real(positive_e_phi);
b = imag(positive_e_phi);

phi_degree = atan2d(b, a);
disp(phi_degree);

%order 3 1 3
Q = R3 * R1 * R3;
disp(Q);
[EVector,EValue] = eig(Q);

lamda = diag(EValue);
disp(lamda);

positive_e_phi = lamda(1);

%Eulers theorem is positive_e_phi = cos(phi) + i*sin(phi)
a = real(positive_e_phi);
b = imag(positive_e_phi);

phi_degree = atan2d(b, a);
disp(phi_degree);
