%%Question 1 

data = [
    10  1   1   1;
    10 -1  -1  -1;
    8   4  -4   4;
    8  -2   2  -2;
    12  3  -3  -3;
    12 -3   3   3
];

m_total = 60;


%Going to be using the equation I_G = I_not - m_total [x_com, y_com, z_com]

for i = 1:size(data, 1)
    m = data(i, 1); %setting mass as first column
    p = data(i, 2:4); %setting points as the rest of the columns x,y,z
    I{i} = pointInertia(m, p);
end

function I = pointInertia(m, p)
    x = p(1);
    y = p(2);
    z = p(3);

    I = m * [y^2 + z^2, -x*y, -x*z;
             -x*y, x^2 + z^2, -y*z;
             -x*z, -y*z, x^2 + y^2];
end

I_not = I{1} + I{2} + I{3} + I{4} + I{5} + I{6};

disp('Initial')
disp(I_not);

%finding center of mass
x_com = sum(data(:,1).*data(:,2)) / m_total;
y_com = sum(data(:,1).*data(:,3)) / m_total;
z_com = sum(data(:,1).*data(:,4)) / m_total;


I_total = m_total * [y_com^2 + z_com^2, -x_com*y_com, -x_com*z_com;
           -x_com*y_com, x_com^2 + z_com^2, -y_com*z_com;
           -x_com*z_com, -y_com*z_com, x_com^2 + y_com^2];

disp('mass matrix part');
disp(I_total)

I_G = I_not - I_total;
disp('answer');
disp(I_G);


%%Question 2 Part
l = (0.33);
m = (0.67);
n = (0.677);

I_11 = I_G(1,1);
I_22 = I_G(2,2);
I_33 = I_G(3,3);
I_12 = I_G(1,2);
I_13 = I_G(1,3);
I_23 = I_G(2,3);

I_mass_moment = I_11*l^2 + I_22*m^2 + I_33*n^2 + 2*I_12*l*m + 2*I_13*l*n + 2*I_23*m*n;

disp('mass moment of inertia');
disp(I_mass_moment);

