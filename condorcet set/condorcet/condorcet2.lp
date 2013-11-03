#hide. 
#const n=11. 
#const m=11. 

#show rank/3. 

%between(V,A,C) :- rank(V,A,B), rank(V,B,C). 
%ord(V,A,B) :- rank(V,A,B), not between(V,A,B). 

node(1..n). 
voter(1..m). 

{ rank(V,A1,A2) } :- A1 != A2, node(A1;A2), voter(V). 

condorcet(A,B) :- node(A;B), A<B. 
condorcet(A,B,D) :- node(D), condorcet(A,B), A != D, B != D. 

% complete
:- node(A1;A2), A1 != A2, voter(V), not rank(V,A1,A2), not rank(V,A2,A1).

% irreflexive
:- rank(V,A1,A2), rank(V,A2,A1). 

% transitive
:- A1 != A3, rank(V,A1,A2), rank(V,A2,A3), not rank(V,A1,A3). 

% redundant constraint to close size of search space

%:- node(A;B), A != B, not ((m-1)/2) { rank(V,A,B) : voter(V) } (m+1)/2 .


% criterion to not contain condorcet set winners

loose(V,A,B,D) :- condorcet(A,B,D), voter(V), rank(V,D,A), rank(V,D,B). 

loose(A,B) :- condorcet(A,B,D), (m+1)/2 { loose(V,A,B,D) : voter(V) }. 

:- condorcet(A,B), not loose(A,B). 


% criterion that the majority graph does not contain a dominating set of size 2

p(A,B) :- node(A;B), (m+1)/2 { rank(V,A,B) : voter(V) }.

% complete
:- node(A;B), A != B, voter(V), not p(A,B), not p(B,A).

% irreflexive
:- p(A,B), p(B,A). 

neg(A,B,D) :- p(D,A), p(D,B), A != D, B != D. 

:- condorcet(A,B), { neg(A,B,D) : A != D : B != D : node(D) } 0.
