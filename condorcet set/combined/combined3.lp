#hide. 
#const m=11. 
#show rank/3. 

voter(1..m). 

node(N) :- dir(N,_). 
node(N) :- dir(_,N). 

{ rank(V,A1,A2) : A1 != A2 : node(A1;A2) } :- voter(V). 

% complete
:- node(A1;A2), A1 != A2, voter(V), not rank(V,A1,A2), not rank(V,A2,A1).

% irreflexive
:- rank(V,A1,A2), rank(V,A2,A1). 

% transitive
:- A1 != A3, rank(V,A1,A2), rank(V,A2,A3), not rank(V,A1,A3). 

:- dir(A1,A2),  (m+1)/2 { rank(V,A2,A1) }. 
