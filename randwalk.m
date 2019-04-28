function [v] = randwalk(g,N)
% Implementation of random walk on networks
% Input: g is a graph (MATLAB object) and N is the number of steps in the random walk. v is vector representing the nodes visited.
% Alternatively use g=graph(A) to create graph object from adjacency matrix A.
A=full(adjacency(g));
n=numnodes(g);
init=randi(n);
v=zeros(N,1);
v(1)=init;
deg=degree(g);
for i=2:N
    c=randi(deg(v(i-1)));
    count=0;
    for j=1:n
        if A(v(i-1),j)==1
            count=count+1;
            if count==c
                next=j; 
            end
        end
    end            
    v(i)=next;
end
end
