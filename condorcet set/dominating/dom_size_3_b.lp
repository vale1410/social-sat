#hide. 
#show dir/2. 
#const n=12. 

node(1..n). 

condorcet(A,B,C) :- node(A;B;C), A<B, B<C, A<C. 

1 { p(A,B), p(B,A) } 1 :- node(A;B), A != B. 

dom(A,B,C,D) :- condorcet(A,B,C), p(A,D), A != D, B != D, C != D. 
dom(A,B,C,D) :- condorcet(A,B,C), p(B,D), A != D, B != D, C != D. 
dom(A,B,C,D) :- condorcet(A,B,C), p(C,D), A != D, B != D, C != D.

:- condorcet(A,B,C), dom(A,B,C,D) : A != D : B != D : C != D : node(D). 

%neg(A,B,C,D) :- dir(D,A), dir(D,B), dir(D,C), A != D, B != D, C != D. 
%
%:- condorcet(A,B,C), { neg(A,B,C,D) : A != D : B != D : C != D : node(D) } 0.
