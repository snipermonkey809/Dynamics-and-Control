%%Part A
%sphere
m = 2;
x = 0;
y = 2;
z = 0;

I_sphere_PA = m * [y^2 + z^2, -x*y, -x*z;
                   -x*y, x^2 + z^2, -y*z;
                   -x*z, -y*z, x^2 + y^2];

%disp('Inertia PA Matrix Sphere:');
%disp(I_sphere_PA);

%Cube
y = -2;
I_cube_PA = m * [y^2 + z^2, -x*y, -x*z;
                 -x*y, x^2 + z^2, -y*z;
                 -x*z, -y*z, x^2 + y^2];

%disp('Inertia PA Matrix Cube:');
%disp(I_cube_PA);

I_sphere = [(4/5), 0, 0;
            0, (4/5), 0;
            0, 0, (4/5)];
I_total_sphere = I_sphere_PA + I_sphere;
%disp('Inertia Total Matrix Sphere:');
%disp(I_total_sphere);

I_cube = [(4/3), 0, 0;
          0, (4/3), 0;
          0, 0, (4/3)];
I_total_cube = I_cube_PA + I_cube;
%disp('Inertia Total Matrix Cube:');
%disp(I_total_cube);

I_cm = I_total_sphere + I_total_cube;
disp('Inertia Total Matrix CM:');
disp(I_cm);

%%Part B
