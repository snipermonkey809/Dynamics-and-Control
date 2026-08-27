clc;

theta = 40;

%basic R1 R2 and R3 matrices being calculated here
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
disp('Q Matrix for order 3 2 1:');
disp(Q);
[EVector,EValue] = eig(Q);
%all the lambda values that we want are on the diagonal of the EValue matrix
%disp(Evalue);

lamda = diag(EValue);
%disp(lamda);

%want to take only the positive eigenvalue to find phi
%I have lambda(2) changed for each part of the problem because I was lazy so i just 
%found which one was positive and hard coded it in
positive_e_phi = lamda(2);


%Eulers theorem is positive_e_phi = cos(phi) + i*sin(phi), each value has a real and imaginary part
%so I split it up
a = real(positive_e_phi);
b = imag(positive_e_phi);

%using atan2d to find angle in degrees because there was an equation that I showed in line 33
%but i just isolated for phi
phi_degree = atan2d(b, a);
disp('phi in degrees:');
disp(phi_degree);

%using a forumula we were given in class to find u_hat
u_hat = (1/(2*sind(phi_degree)))*[Q(2,3) - Q(3,2); 
                                  Q(3,1) - Q(1,3); 
                                  Q(1,2) - Q(2,1)];
disp('u_hat:');
disp(u_hat);

%order 1 2 3
Q = R1 * R2 * R3;
disp('Q Matrix for order 1 2 3:');
disp(Q);
[EVector,EValue] = eig(Q);

lamda = diag(EValue);
%disp(lamda);

positive_e_phi = lamda(1);



%Eulers theorem is positive_e_phi = cos(phi) + i*sin(phi)
a = real(positive_e_phi);
b = imag(positive_e_phi);

phi_degree = atan2d(b, a);
disp('phi in degrees:');
disp(phi_degree);

u_hat = (1/(2*sind(phi_degree)))*[Q(2,3) - Q(3,2); 
                                  Q(3,1) - Q(1,3); 
                                  Q(1,2) - Q(2,1)];
disp('u_hat:');
disp(u_hat);

%order 3 1 3
Q = R3 * R1 * R3;
disp('Q Matrix for order 3 1 3:');
disp(Q);
[EVector,EValue] = eig(Q);

lamda = diag(EValue);
%disp(lamda);

positive_e_phi = lamda(1);

%Eulers theorem is positive_e_phi = cos(phi) + i*sin(phi)
a = real(positive_e_phi);
b = imag(positive_e_phi);

phi_degree = atan2d(b, a);
disp('phi in degrees:');
disp(phi_degree);

u_hat = (1/(2*sind(phi_degree)))*[Q(2,3) - Q(3,2); 
                                  Q(3,1) - Q(1,3); 
                                  Q(1,2) - Q(2,1)];
disp('u_hat:');
disp(u_hat);