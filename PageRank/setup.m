R = ones(3);
R = R(:,1);

M = [0,0,0;0.5,0,0;0.5,1,1];
K = diag(sum(M));
A = K^-1 * M;

beta = 0.7;

R_j = pagerank(A,R,beta,0.01);

R_j

R = [1;1;1];
M = [0,0,1;0.5,0,0;0.5,1,0];
K = diag(sum(M));
A = K^-1 * M;
beta = 0.85;
R_j = pagerank(A,R,beta,0.000001);
R_j