#hide. 
#show dir/2. 
#const n=7. 

node(1..n). 

condorcet(A,B) :- node(A;B), A<B. 

1 { dir(A,B), dir(B,A) } 1 :- node(A;B), A != B. 

neg(A,B,D) :- dir(D,A), dir(D,B), A != D, B != D. 

:- condorcet(A,B), { neg(A,B,D) : A != D : B != D : node(D) } 0.
