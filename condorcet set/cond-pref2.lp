#hide. 
#const n=11. 
#const m=11. 
#show ord/3. 
#show loose/2. 

between(V,A,C) :- rank(V,A,B), rank(V,B,C). 
ord(V,A,B) :- rank(V,A,B), not between(V,A,B). 

voter(1..m). 
node(1..n). 

first(1). 
next_node(N,N+1) :- node(N). 
next_voter(N,N+1) :- voter(N). 

{ rank(V,A1,A2) } :- A1 != A2, node(A1;A2), voter(V). 

% complete
:- node(A1;A2), A1 != A2, voter(V), not rank(V,A1,A2), not rank(V,A2,A1).

% irreflexive
:- rank(V,A1,A2), rank(V,A2,A1). 

% transitive
:- A1 != A3, rank(V,A1,A2), rank(V,A2,A3), not rank(V,A1,A3). 

condorcet(A,B) :- node(A;B), A<B. 
condorcet(A,B,D) :- node(D), condorcet(A,B), A != D, B != D. 

loose(V,A,B,D) :- condorcet(A,B,D), voter(V), rank(V,D,A), rank(V,D,B). 

loose(A,B) :- condorcet(A,B,D), (m+1)/2 { loose(V,A,B,D) : voter(V) }. 

:- condorcet(A,B), not loose(A,B). 
