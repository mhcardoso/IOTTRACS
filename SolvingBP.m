%%%%%%%% Proper attempt at solving the Basis Pursuit Problem
%%% ------------------- INPUT -----------------------------
%%% n is the size of the square matrix used as a data set
%%% m is the number of measurements taken from the data set matrix NxN
%%% deep is the depth of the data set (1, 24, probably unnecessary)
%%% inspect dataset before hand to see if your NxN matrix doesn't have any
%%% -9999 values
%%%------------------- OUTPUT ----------------------------
%%% normalized_error is the error obtained according to the metric defined
%%% in the paper
function normalized_error = SolvingBP(n,m,deep)
[depth, latitude, longitude, temperature, salinity, zonal_current, meridional_current, sea_surface_height] = parsedata('scb_das_2013040903.nc');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%as per the paper:
%deep = 1;
%n = 50;
%m = 40;

a = salinity(:,:, deep);
U = a(1:n, 1:n);

V = fft2(U);

u = U(:); %100x1
v = V(:); %100x1

Wi = dftmtx(n); %10x10
Wj = dftmtx(n); %10x10

not_Psi = kron(Wi, Wj); %100x100
Psi = inv(not_Psi);     %100x100

%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r = eye(n*n);
c = randperm(length(r), m);
%R = randi([0 1], m, n*n);
%R = randn(m,n*n);
R = r(c,:);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y=R*u;
vp = SolveBP(R*real(Psi), y, n*n);
up = real(Psi*vp);
%figure; plot(u, 'b.'); hold on; plot(up, 'r.');
normalized_error = norm(up - u,2)/norm(u,2);

end