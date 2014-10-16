import numpy as np

def PageRank(M, beta, epsilon):
    N = M.shape[0]
    # array of 1s used to multiply teleportation probability
    E = np.ones((N,N))
    R = np.zeros(N)
    R[R==0] = 1/float(N)
    R_last = R
    delta = epsilon
    while delta >= epsilon:
        #compute PageRank R
        R = np.dot((beta * M + (1-beta)/N * E ) , R_last)
        # replace lost votes from dead ends
        R = R + (1-np.sum(R))/len(R)
        dist = R - R_last
        delta = np.sqrt(np.dot(dist,dist))
        R_last = R
    return R

# example use of the function
M = np.array([[0,0,1],[0.5,0,0],[0.5,1,0]])
beta = 0.85
epsilon = 0.01
print(PageRank(M,beta,epsilon))
