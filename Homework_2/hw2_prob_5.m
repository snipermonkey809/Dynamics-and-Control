%part 1
I = [783.4667, 351.7333, 40.2667;
     351.7333, 783.4667, -80.2667;
     40.2667, -80.2667, 783.4667];

[EVector,EValue] = eig(I);
lamda = diag(EValue);

disp('Eigenvalues:');
disp(lamda);
disp('Eigenvectors:');
disp(EVector);

%part 2
DCM = EVector';

%checking if det is less than zero, if it is flip the sign of the column of the eigenvector
if det(DCM) < 0
     EVector(:,3) = -EVector(:,3);
     DCM = EVector';
end

disp('DCM:');
disp(DCM); 

%part 3
disp('Determinant of dcm:');
disp(det(DCM));

verification = DCM * I * DCM';
disp('Verification:');
disp(verification); 