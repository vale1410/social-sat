
#hide. 
#const n=11. 
#const m=11. 
#show rank/3. 
#show win/4. 

%between(V,A,C) :- rank(V,A,B), rank(V,B,C). 
%ord(V,A,B) :- rank(V,A,B), not between(V,A,B). 

voter(1..m). 
node(1..n). 

{ rank(V,A1,A2) : A1 != A2 : node(A1;A2) } :- voter(V). 

% complete
:- node(A1;A2), A1 != A2, voter(V), not rank(V,A1,A2), not rank(V,A2,A1).

% irreflexive
:- rank(V,A1,A2), rank(V,A2,A1). 

% transitive
:- A1 != A3, rank(V,A1,A2), rank(V,A2,A3), not rank(V,A1,A3). 

condorcet(A,B) :- node(A;B), A<B. 
condorcet(A,B,D) :- node(D), condorcet(A,B), A != D, B != D.

win(V,A,B,D) :- condorcet(A,B,D), rank(V,A,D). 
win(V,A,B,D) :- condorcet(A,B,D), rank(V,B,D). 

:- condorcet(A,B,D), (m+1)/2 { win(V,A,B,D) : voter(V) }. 
