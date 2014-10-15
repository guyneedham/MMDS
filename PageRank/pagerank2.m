function[R] = pagerank2(M, beta, epsilon)
% function computes PageRank scores
% for a matrix M which includes dead ends and spider-traps
% arguments:
% M a propensity matrix for a directed graph
% no pre-processing of the matrix
% a large M will not fit into memory
% we should use MapReduce to avoid materialising the matrix M
% beta, a teleporting probability
% epsilon, an error term

% code is vectorised

N = size(M)(1);
E = ones(N);
% initialise R as 1/N
R = zeros(N,1);
R(:) = 1/N;
R_last = R;
delta=epsilon;
count=0;
while (delta >= epsilon)
    % compute the PageRank R, will take care of spider traps
    R = (beta * M + (1-beta)/N * E) * R_last;
    % find any missing weight and re-insert it
    % replaces lost votes from dead ends
    R = R + (1-sum(R))/rows(R);
    dist = R-R_last;
    delta = sqrt(dot(dist,dist));
    R_last = R;
    count=count+1
    R
end