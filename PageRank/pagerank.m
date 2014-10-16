function[R] = pagerank(A, R, beta, epsilon)
%pagerank function returns R, vector of PageRanks
%arguments:
%A - adjusted adjacency matrix
%    adjacency matrix divided by out-degree
%    pre-processing step to take care of dead ends
%    M = M + (1-sum(M))/rows(M)
%    K = diag(sum(M))
%    A = K^-1 * M
%    obviously we don't want to preprocess M

%R - initial ranking vector, usually all 1/N
%beta - dampening factor = teleport probability
%epsilon - convergence threshold

N = size(A)(1);
% E = matrix one 1s, used to broadcast teleportation
E = ones(N);
R_last = R;
delta=epsilon;
count=0;
while (delta >= epsilon)
%while (count <= 4)
    R = (beta * A + (1-beta)/N * E) * R_last;
    dist = R-R_last;
    delta = sqrt(dot(dist,dist));
    R_last = R;
    count=count+1
    R
end
