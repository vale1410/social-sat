 

#hide. 
#const n=11. 
#const m=11. 
#show rank/3. 
#show win/5. 

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

condorcet(A,B,C) :- node(A;B;C), A<B, B<C, A<C. 
condorcet(A,B,C,D) :- node(D), condorcet(A,B,C), A != D, B != D, C != D.

win(V,A,B,C,D) :- condorcet(A,B,C,D), rank(V,A,D). 
win(V,A,B,C,D) :- condorcet(A,B,C,D), rank(V,B,D). 
win(V,A,B,C,D) :- condorcet(A,B,C,D), rank(V,C,D).

:- condorcet(A,B,C,D), (m+1)/2 { win(V,A,B,C,D) : voter(V) }. 
