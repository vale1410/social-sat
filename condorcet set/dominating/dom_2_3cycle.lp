#hide. 
#show dir/2. 
#const n=7. 

node(1..n). 

condorcet(A,B) :- node(A;B), A<B. 

1 { dir(A,B), dir(B,A) } 1 :- node(A;B), A != B. 

% D beats both A and B
neg(A,B,D) :- dir(D,A), dir(D,B), condorcet(A,B). 

% There has to exists at least one D that beats A,B
:- condorcet(A,B), { neg(A,B,D) : node(D) } 0.

% no three cycle is allowed!
:- dir(A,B), dir(B,C), dir(C,A). 
