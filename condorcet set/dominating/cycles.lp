#hide. 
#show dir/2. 
#const n=3. 

node(1..n). 

1 { dir(A,B), dir(B,A) } 1 :- node(A;B), A != B. 

% every node needs to dominate at least another!
% or; outdegree at least 1
:- node(A), { dir(A,D) : node(D) } 0.
