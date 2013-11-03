#hide. 
#show dir/2. 
#const n=12. 

node(1..n). 

condorcet(A,B,C) :- node(A;B;C), A<B, B<C, A<C. 
condorcet(A,B,C,D) :- node(D), condorcet(A,B,C), A != D, B != D, C != D.

1 { p(A,B), p(B,A) } 1 :- node(A;B), A != B. 

neg(A,B,C,D) :- condorcet(A,B,C,D), p(D,A), p(D,B), p(D,C). 

loose(A,B,C) :- condorcet(A,B,C,D), neg(A,B,C,D). 

:- condorcet(A,B,C), not loose(A,B,C). 
