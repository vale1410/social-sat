#hide. 
#show dir/2. 
#const n=12. 

node(1..n). 

condorcet(A,B,C) :- node(A;B;C), A<B, B<C, A<C. 

1 { dir(A,B), dir(B,A) } 1 :- node(A;B), A != B. 

neg(A,B,C,D) :- dir(D,A), dir(D,B), dir(D,C), A != D, B != D, C != D. 

:- condorcet(A,B,C), { neg(A,B,C,D) : A != D : B != D : C != D : node(D) } 0.
