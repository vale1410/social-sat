#hide. 
#const m=11. 
#show rank/3. 

voter(1..m). 

node(N) :- dir(N,_). 
node(N) :- dir(_,N). 

pair(A1,A2) :- A1 < A2 , node(A1;A2).

{ rank(V,A1,A2) : pair(A1,A2)  } :- voter(V). 

% transitive
:- rank(V,A1,A2), rank(V,A2,A3), not rank(V,A1,A3). 
:- pair(A2,A1), pair(A3,A2), not rank(V,A2,A1), not rank(V,A3,A2), rank(V,A3,A1). 

%:- dir(A1,A2),  { rank(V,A1,A2) } (m-1)/2 . 
